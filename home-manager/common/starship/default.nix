{ lib, ... }:
let
  # https://coolors.co/420039-8f1639-db2b39-e76926-e7940d-83955a-1282a2-edd2e0

  # Nix shell
  nix_shell_bg = "#E76926";
  nix_shell_fg = "#151F28";

  # username
  section_1_bg = "#8F1639";
  section_1_fg = "#EDD2E0";

  # directory
  section_2_bg = "#DB2B39";
  section_2_fg = "#EDD2E0";

  # fill
  fill_bg = "#0E131F";
  fill_fg = "#151F28";

  # svc
  section_3_bg = "#F29E18";
  section_3_fg = "#151F28";
  section_3_1_bg = "#F29E18";
  section_3_1_fg = "#151F28";

  # status
  section_4_bg = "#2e294e";
  section_4_fg = "#EDD2E0";

  # cmd_duration
  section_5_bg = "#1282A2";
  section_5_fg = "#151F28";

  # job
  section_6_bg = "#83955A";
  section_6_fg = "#151F28";

  # icons
  left_icon = "";
  right_icon = "";
  fill_icon = " ";
  prompt_icon = "  ";
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$sudo"
        # "[${left_icon}](bg:${section_1_bg} fg:${fill_bg})"
        "$username"
        "[${left_icon}](bg:${section_2_bg} fg:${section_1_bg})"
        "$directory"
        "[${left_icon}](bg:${section_3_bg} fg:${section_2_bg})"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "[${left_icon}](fg:${section_3_bg} bg:${fill_bg})"
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
        # "[${left_icon}](bg:${fill_bg} fg:${section_3_1_bg})"
        "$line_break"
        "$character"
      ];
      add_newline = false;
      username = {
        show_always = true;
        style_user = "bg:${section_1_bg} fg:${section_1_fg}";
        style_root = "bg:${section_1_bg} fg:${section_1_fg}";
        format = "[ $user ]($style)";
      };
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
        disabled = false;
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
        format = "[ $hash$tag ]($style)";
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
