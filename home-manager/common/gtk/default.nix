{
  # GTK.
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-purple-dark";
    };
    theme = {
      name = "Yaru-purple-dark";
    };
    gtk3 = {
      extraConfig = {
        gtk-theme-name = "Yaru-purple-dark";
        gtk-icon-theme-name = "Yaru-purple-dark";
        gtk-font-name = "Lexend 10";
        gtk-cursor-theme-name = "Yaru";
        gtk-cursor-theme-size = 0;
        gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 1;
        gtk-menu-images = 1;
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-error-bell = 0;
      };
    };
  };

  # Custom settings.
  home.file = {
    ".icons/default/index.theme".text = ''[Icon Theme]
Inherits=Yaru
    '';
  };
}
