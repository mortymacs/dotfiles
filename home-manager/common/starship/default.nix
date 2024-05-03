{ lib, ... }:
let
  # Colors:
  ## https://coolors.co/351431-2b2d42-eb5e55-e23e58-d81e5b-82264f-e26d5a-e7ada3-ececec-0a9396
  ## https://coolors.co/351431-2b2d42-eb5e55-e23e58-d81e5b-82264f-e26d5a-e7ada3-ececec
  ## https://coolors.co/ff4f79-973c64-633359-492e54-2e294e
  ## https://coolors.co/82264f-6f2043-4f1730-2f0e1d-200a14-10050a
  ## https://coolors.co/361134-ea526f-ffe5d4-03b5aa

  # Nix shell
  nix_shell_bg = "#492E54";
  nix_shell_fg = "#FFE5D4";

  # username
  section_1_bg = "#832161";
  section_1_fg = "#FFE5D4";

  # directory
  section_2_bg = "#E23E58";
  section_2_fg = "#FFE5D4";

  # fill
  fill_bg = "#0E131F";
  fill_fg = "#151F28";

  # svc
  section_3_bg = "#D81E5B";
  section_3_fg = "#FFE5D4";
  section_3_1_bg = "#ED4A4A";
  section_3_1_fg = "#FFE5D4";

  # status
  section_4_bg = "#2E294E";
  section_4_fg = "#FFE5D4";

  # cmd_duration
  section_5_bg = "#973C64";
  section_5_fg = "#FFE5D4";

  # job
  section_6_bg = "#633359";
  section_6_fg = "#FFE5D4";

  # icons
  left_icon = "";
  right_icon = "";
  fill_icon = " ";
  prompt_icon = "  ";
in {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$sudo"
        #"[${left_icon}](bg:${section_1_bg} fg:${fill_bg})"
        "$username"
        "[${left_icon}](bg:${section_2_bg} fg:${section_1_bg})"
        "$directory"
        "[${left_icon}](bg:${section_3_bg} fg:${section_2_bg})"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "[${left_icon}](fg:${section_3_bg})"
        "$fill"
        "[${right_icon}](bg:${fill_bg} fg:${nix_shell_bg})"
        "$nix_shell"
        "[${right_icon}](bg:${nix_shell_bg} fg:${section_4_bg})"
        "$status"
        "[${right_icon}](bg:${section_4_bg} fg:${section_5_bg})"
        "$cmd_duration"
        "[${right_icon}](bg:${section_5_bg} fg:${section_6_bg})"
        "$jobs"
        "[${right_icon}](bg:${section_6_bg} fg:${section_3_1_bg})"
        "$git_status"
        #"[${left_icon}](bg:${fill_bg} fg:${section_3_1_bg})"
        "$line_break"
        "$character"
      ];
      add_newline = false;
      character = {
        format = "$symbol";
        success_symbol = "[${prompt_icon}](purple)";
        error_symbol = "[${prompt_icon}](red)";
        vimcmd_symbol = "[${prompt_icon}](green)";
      };
      fill = {
        symbol = "${fill_icon}";
        style = "bg:${fill_bg} fg:${fill_fg}";
      };
      nix_shell = {
        style = "bg:${nix_shell_bg} fg:${nix_shell_fg}";
        symbol = " ";
        format = "[ $symbol ]($style)";
      };
      sudo = {
        disabled = false;
        format = "[$symbol]($style)";
        style = "bg:${section_1_bg} fg:${section_1_fg}";
        symbol = " 󰯄";
      };
      username = {
        show_always = true;
        style_user = "bg:${section_1_bg} fg:${section_1_fg}";
        style_root = "bg:${section_1_bg} fg:${section_1_fg}";
        format = "[ $user ]($style)";
      };
      directory = {
        style = "bg:${section_2_bg} fg:${section_2_fg}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };
      git_branch = {
        symbol = "";
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[ $symbol$branch ]($style)";
      };
      git_commit = {
        tag_symbol = " 󰓼 ";
        tag_disabled = false;
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[ $hash$tag ]($style)";
      };
      git_state = {
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[ $state($progress_current/$progress_total) ]($style)";
      };
      git_status = {
        ahead = "  ";
        behind = "  ";
        diverged = " 󱡷 ";
        deleted = " 󰆳 ";
        renamed = "  ";
        conflicted = "  ";
        modified = " 󱀱 ";
        stashed = " 󱀲 ";
        untracked = " 󱪝 ";
        staged = " ● ";
        style = "bg:${section_3_1_bg} fg:${section_3_1_fg}";
        format = "[$all_status$ahead_behind]($style)";
      };
      status = {
        style = "bold bg:${section_4_bg} fg:${section_4_fg}";
        format = "[ $status ]($style)";
        disabled = false;
      };
      cmd_duration = {
        style = "bold bg:${section_5_bg} fg:${section_5_fg}";
        format = "[ $duration ]($style)";
      };
      jobs = {
        symbol = "+";
        style = "bold bg:${section_6_bg} fg:${section_6_fg}";
        number_threshold = 1;
        format = "[ $symbol$number ]($style)";
      };
    };
  };
}
