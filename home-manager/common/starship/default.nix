{ lib, ... }:
let
  # Nix shell
  nix_shell_fg = "#48cae4";

  # username
  section_1_fg = "#D81E5B";

  # directory
  section_2_fg = "#EB5E55";

  # svc
  section_3_fg = "#c77dff";
  section_3_1_fg = "#2a9d8f";
  section_3_2_fg = "#da627d";

  # status
  section_4_fg = "#ff006e";

  # cmd duration.
  section_5_fg = "#a3b18a";

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
        "$nix_shell"
        "$status"
        "$cmd_duration"
        "$python"
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
        success_symbol = "[ ](purple)";
        error_symbol = "[ ](red)";
        vimcmd_symbol = "[ ](green)";
        vimcmd_replace_one_symbol = "[ ](orange})";
        vimcmd_replace_symbol = "[ ](organge)";
        vimcmd_visual_symbol = "[ ](${section_3_fg})";
      };
      nix_shell = {
        disabled = false;
        style = "fg:${nix_shell_fg}";
        symbol = "";
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
        symbol = "";
        style = "fg:${section_3_fg}";
        format = "[ $symbol $branch]($style)";
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
      git_metrics = {
        disabled = false;
        added_style = "fg:${section_3_1_fg}";
        deleted_style = "fg:${section_3_2_fg}";
        format = " ([+$added]($added_style))([-$deleted]($deleted_style))";
      };
      status = {
        style = "bold fg:${section_4_fg}";
        format = "[ $status]($style)";
        disabled = false;
      };
      cmd_duration = {
        style = "fg:${section_5_fg}";
        format = " [󰦖 $duration]($style)";
      };
      python = {
        detect_files = [ ];
        detect_extensions = [ ];
        format = "[  $virtualenv]($style)";
      };
    };
  };
}
