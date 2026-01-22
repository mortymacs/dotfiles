{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.unstable.ghostty;
    systemd.enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      # Theme.
      theme = "Ayu";

      # Font.
      font-family = "monospace";
      font-size = 14;

      # Windowe.
      window-width = 130;
      window-height = 20;
      window-theme = "ghostty";
      window-padding-x = 5;
      window-padding-y = 5;
      window-subtitle = false;

      # Misc.
      copy-on-select = "clipboard";
      bell-features = "no-audio";
      gtk-single-instance = true;
    };
    themes = {
      Ayu = {
        background = "#151b21";
      };
    };
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
