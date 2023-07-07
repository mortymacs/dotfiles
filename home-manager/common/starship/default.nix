{ lib, ... }:
let
  # Colors:
  ## https://coolors.co/351431-2b2d42-eb5e55-e23e58-d81e5b-82264f-e26d5a-e7ada3-ececec
  ## https://coolors.co/351431-2c1129-1d0b1b-160915-0f060e

  # username
  section_1_bg = "#EB5E55";
  section_1_fg = "#ECECEC";

  # directory
  section_2_bg = "#E23E58";
  section_2_fg = "#ECECEC";

  # svc
  section_3_bg = "#D81E5B";
  section_3_fg = "#ECECEC";

  # misc
  section_4_bg = "#351431";
  section_4_fg = "#8E3E84";

  # prompt
  section_5_bg = "#2C1129";
  section_6_bg = "#1D0B1B";
  section_7_bg = "#160915";
  section_8_bg = "#0F060E";

  # icon
  #icon = "";
  icon = "";

in {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$sudo"
        "$username"
        "[${icon}](bg:${section_2_bg} fg:${section_1_bg})"
        "$directory"
        "[${icon}](bg:${section_3_bg} fg:${section_2_bg})"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "[${icon}](bg:${section_4_bg} fg:${section_3_bg})"
        "$status"
        "$cmd_duration"
        "$jobs"
        # "[${icon}](fg:${section_4_bg}) "
        "[ ](bg:${section_5_bg})[ ](bg:${section_6_bg})[ ](bg:${section_7_bg})[ ](bg:${section_8_bg}) "
      ];
      add_newline = false;
      username = {
        show_always = true;
        style_user = "bg:${section_1_bg} fg:${section_1_fg}";
        style_root = "bg:${section_1_bg} fg:${section_1_fg}";
        format = "[ $user ]($style)";
      };
      directory = {
        style = "bg:${section_2_bg}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = "";
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[ $symbol$branch]($style)";
      };
      git_commit = {
        tag_disabled = false;
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[($hash$tag)]($style)";
      };
      git_state = {
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[($state($progress_current/$progress_total))]($style)";
      };
      git_status = {
        ahead = "^";
        behind = "v";
        diverged = "//";
        deleted = "x";
        renamed = ">>";
        style = "bg:${section_3_bg} fg:${section_3_fg}";
        format = "[$all_status$ahead_behind ]($style)";
      };
      status = {
        style = "bold bg:${section_4_bg} fg:${section_4_fg}";
        format = "[ $status ]($style)";
        disabled = false;
      };
      cmd_duration = {
        style = "bold bg:${section_4_bg} fg:${section_4_fg}";
        format = "[ $duration ]($style)";
      };
      jobs = {
        symbol = "+";
        style = "bold bg:${section_4_bg} fg:${section_4_fg}";
        number_threshold = 1;
        format = "[ [$symbol$number] ]($style)";
      };
    };
  };
}
