#!/usr/bin/env python3
import re
import sys

RESET = "\033[0m"
BOLD = "\033[1m"
DIM = "\033[2m"
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
CYAN = "\033[36m"

ANSI_RE = re.compile(r"\x1b\[[0-9;]*m")

SKIP_PREFIXES = (
    "index ",
    "--- ",
    "+++ ",
    "similarity index",
    "dissimilarity index",
    "old mode",
    "new mode",
)

STATUS_COLORS = {
    "new": GREEN,
    "deleted": RED,
    "renamed": CYAN,
    "copied": CYAN,
    "modified": YELLOW,
}


def strip_ansi(s):
    return ANSI_RE.sub("", s)


def emit(num, prefix, content, color):
    num_str = f"{num:>5}" if num is not None else "     "
    if color:
        sys.stdout.write(
            f"{DIM}{num_str}{RESET} {DIM}│{RESET} {color}{prefix}{content}{RESET}\n"
        )
    else:
        sys.stdout.write(f"{DIM}{num_str}{RESET} {DIM}│{RESET} {prefix}{content}\n")


def flush_header(header):
    if header is None:
        return
    status = header["status"]
    color = STATUS_COLORS.get(status, YELLOW)
    label = f"{status:<9}"
    if status == "renamed" and header["old_path"]:
        path = f"{header['old_path']} → {header['path']}"
    else:
        path = header["path"]
    sys.stdout.write(f"\n{BOLD}{color}{label}{RESET}{BOLD}{YELLOW}{path}{RESET}\n")


def main():
    old_line = 0
    new_line = 0
    in_hunk = False
    pending_header = None

    for raw in sys.stdin:
        line = raw.rstrip("\n")
        plain = strip_ansi(line)

        if plain.startswith("diff --git"):
            flush_header(pending_header)
            m = re.search(r" b/(.+)$", plain)
            path = m.group(1) if m else plain
            pending_header = {"path": path, "status": "modified", "old_path": None}
            in_hunk = False
            continue

        if pending_header is not None:
            if plain.startswith("new file mode"):
                pending_header["status"] = "new"
                continue
            if plain.startswith("deleted file mode"):
                pending_header["status"] = "deleted"
                continue
            if plain.startswith("rename from "):
                pending_header["status"] = "renamed"
                pending_header["old_path"] = plain[len("rename from "):]
                continue
            if plain.startswith("rename to "):
                pending_header["path"] = plain[len("rename to "):]
                continue
            if plain.startswith("copy from "):
                pending_header["status"] = "copied"
                pending_header["old_path"] = plain[len("copy from "):]
                continue
            if plain.startswith("copy to "):
                pending_header["path"] = plain[len("copy to "):]
                continue

        if plain.startswith(SKIP_PREFIXES):
            continue

        if pending_header is not None and (
            plain.startswith("@@")
            or plain.startswith("Binary files")
        ):
            flush_header(pending_header)
            pending_header = None

        if plain.startswith("@@"):
            m = re.match(r"@@ -(\d+)(?:,\d+)? \+(\d+)(?:,\d+)? @@", plain)
            if m:
                old_line = int(m.group(1))
                new_line = int(m.group(2))
            in_hunk = True
            continue

        if plain.startswith("Binary files"):
            sys.stdout.write(f"{DIM}    {plain}{RESET}\n")
            continue

        if in_hunk:
            if plain.startswith("-"):
                emit(old_line, "- ", plain[1:], RED)
                old_line += 1
                continue
            if plain.startswith("+"):
                emit(new_line, "+ ", plain[1:], GREEN)
                new_line += 1
                continue
            if plain.startswith(" "):
                emit(new_line, "  ", plain[1:], "")
                old_line += 1
                new_line += 1
                continue
            if plain.startswith("\\"):
                continue

        sys.stdout.write(line + "\n")

    flush_header(pending_header)


if __name__ == "__main__":
    try:
        main()
    except BrokenPipeError:
        pass
