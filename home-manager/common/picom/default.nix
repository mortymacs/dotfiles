{
  services.picom = {
    enable = false;
    backend = "glx";
    shadow = true;
    fade = false;
    activeOpacity = 0.99;
    inactiveOpacity = 0.99;
    opacityRules = [ "100:class_g *= 'firefox'" "100:class_g *= 'Microsoft Teams'" "100:class_g = 'xsecurelock'" ];
    shadowExclude = [ "window_type *= 'menu'" "window_type *= 'utility'" "class_g = 'xsecurelock'" ];
    settings = {
      corner-radius = 0;
      rounded-corners-exclude = [
        "window_type *= 'menu'"
        "window_type *= 'utility'"
        "window_type *= 'dropdown_menu'"
        "window_type *= 'popup_menu'"
        "class_g = 'xsecurelock'"
        "class_g = 'Polybar'"
        "class_g = 'Rofi'"
        "class_g = 'Dunst'"
      ];
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
      blur-background-exclude =
        [ "window_type *= 'menu'" "window_type *= 'utility'" "class_g = 'xsecurelock'" ];
    };
  };
}
