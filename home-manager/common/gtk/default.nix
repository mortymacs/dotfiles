let
  extraConfig = {
    gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
    gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    gtk-decoration-layout = "appmenu:none";
    gtk-button-images = 1;
    gtk-menu-images = 1;
    gtk-enable-event-sounds = 0;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintfull";
    gtk-error-bell = 0;
    gtk-application-prefer-dark-theme = true;
  };
  gtk4ExtraConfig = {
    gtk-decoration-layout = "appmenu:none";
    gtk-enable-event-sounds = 0;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintfull";
    gtk-error-bell = 0;
    gtk-application-prefer-dark-theme = true;
  };
in {
  # GTK.
  gtk = {
    enable = true;
    theme.name = "Yaru-purple-dark";
    iconTheme.name = "Yaru-purple-dark";
    cursorTheme.name = "Yaru";
    font = {
      name = "Lexend";
      size = 10;
    };
    gtk3.extraConfig = extraConfig;
    gtk4.extraConfig = gtk4ExtraConfig;
  };

  # Custom settings.
  home.file = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits=Yaru
    '';
  };
}
