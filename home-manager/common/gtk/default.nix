let
in {
  # GTK.
  gtk = {
    enable = true;
    theme.name = "Adwaita";
    iconTheme.name = "Adwaita";
    cursorTheme.name = "Adwaita";
    font = {
      name = "Lexend";
      size = 10;
    };
  };

  # Custom settings.
  home.file = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits="Adwaita"
    '';
  };
}
