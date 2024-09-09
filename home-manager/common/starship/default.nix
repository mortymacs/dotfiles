{ lib, ... }:
let
  # Nix shell
  nix_shell_fg = "#03b5aa";

  # username
  section_1_fg = "#C2BBF0";

  # directory
  section_2_fg = "#f48c06";

  # fill
  fill_fg = "#30323d";

  # svc
  section_3_fg = "#ffba08";

  # status
  section_4_fg = "#f5e2c8";

  # cmd_duration
  section_5_fg = "#90e0ef";

  # job
  section_6_fg = "#ff4d80";

  # icons
  fill_icon = "─";
  prompt_icon = "  ";
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$sudo"
        "$username"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        " $fill"
        "$nix_shell"
        "$status"
        "$cmd_duration"
        "$jobs"
        "$git_status"
        "$line_break"
        "$character"
      ];
      add_newline = false;
      username = {
        show_always = true;
        style_user = "fg:${section_1_fg}";
        style_root = "fg:${section_1_fg}";
        format = "[$user]($style)";
      };
      character = {
        format = "$symbol";
        success_symbol = "[${prompt_icon}](purple)";
        error_symbol = "[${prompt_icon}](red)";
        vimcmd_symbol = "[${prompt_icon}](green)";
      };
      fill = {
        symbol = "${fill_icon}";
        style = "fg:${fill_fg}";
      };
      nix_shell = {
        disabled = false;
        style = "fg:${nix_shell_fg}";
        symbol = " ";
        format = "[ $symbol]($style)";
      };
      sudo = {
        disabled = false;
        format = "[$symbol ]($style)";
        style = "fg:${section_1_fg}";
        symbol = "󰯄";
      };
      directory = {
        style = "fg:${section_2_fg}";
        format = "[ $path]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };
      git_branch = {
        style = "fg:${section_3_fg}";
        format = "[ \\[$branch\\]]($style)";
      };
      git_commit = {
        tag_symbol = " 󰓼 ";
        tag_disabled = false;
        style = "fg:${section_3_fg}";
        format = "[ $hash$tag]($style)";
      };
      git_state = {
        style = "fg:${section_3_fg}";
        format = "[ $state($progress_current/$progress_total)]($style)";
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
        style = "fg:${section_3_fg}";
        format = "[$all_status$ahead_behind]($style)";
      };
      status = {
        style = "bold fg:${section_4_fg}";
        format = "[ $status]($style)";
        disabled = false;
      };
      cmd_duration = {
        style = "bold fg:${section_5_fg}";
        format = "[ $duration]($style)";
      };
      jobs = {
        symbol = "+";
        style = "bold fg:${section_6_fg}";
        number_threshold = 1;
        format = "[ $symbol$number]($style)";
      };
    };
  };
}
