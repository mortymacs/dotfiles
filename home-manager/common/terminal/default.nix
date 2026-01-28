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
      theme = "Cutie Pro";

      # Font.
      font-family = "monospace";
      font-size = 14;

      # Windowe.
      window-width = 130;
      window-height = 30;
      window-theme = "ghostty";
      window-padding-x = 5;
      window-padding-y = 5;
      window-subtitle = false;

      # Misc.
      copy-on-select = "clipboard";
      clipboard-trim-trailing-spaces = true;
      app-notifications = false;
      bell-features = "no-audio";
      gtk-single-instance = true;

      # Keymaps.
      keybind = [
        "ctrl+shift+s=new_split:right"
        "ctrl+shift+h=new_split:down"
        "ctrl+shift+left=goto_split:left"
        "ctrl+shift+right=goto_split:right"
        "ctrl+shift+up=goto_split:up"
        "ctrl+shift+down=goto_split:down"
      ];
    };
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
