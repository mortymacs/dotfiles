{
  services.picom = {
    enable = false;
    backend = "glx";
    shadow = true;
    fade = false;
    activeOpacity = 0.999;
    inactiveOpacity = 0.999;
    shadowExclude = [ "window_type *= 'menu'" ];
    settings = {
      corner-radius = 0;
      rounded-corners-exclude = [
        "window_type = 'menu'"
        "window_type = 'dropdown_menu'"
        "window_type = 'popup_menu'"
        "class_g = 'Polybar'"
        "class_g = 'Rofi'"
        "class_g = 'Dunst'"
      ];
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}
