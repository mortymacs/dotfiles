#!/usr/bin/env nix-shell
#!nix-shell -i bash -p curl jq

set -euo pipefail

VERSION=${1:-}

if [[ -z "$VERSION" ]]; then
  VERSION=$(curl -sf "https://api.github.com/repos/zed-industries/zed/releases/latest" \
    | jq -r '.tag_name | ltrimstr("v")')
fi

URL="https://github.com/zed-industries/zed/releases/download/v${VERSION}/zed-linux-x86_64.tar.gz"

echo "Fetching hash for v${VERSION}..." >&2

# fetchurl expects a flat file hash (the compressed tarball as-is).
HASH=$(nix store prefetch-file --json \
  --extra-experimental-features 'nix-command' \
  "$URL" | jq -r '.hash')

echo ""
echo "# overlays/custom.nix — fetchurl block"
echo "version = \"${VERSION}\";"
echo "hash    = \"${HASH}\";  # flat file hash (fetchurl)"
