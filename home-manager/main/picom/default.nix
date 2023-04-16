{
  services.picom = {
    enable = true;
    backend = "glx";
    shadow = true;
    activeOpacity = 0.9;
    inactiveOpacity = 0.9;
    shadowExclude = [
      "window_type *= 'menu'"
      "class_g = 'firefox' && window_type = 'utility'"
      "focused = 1"
    ];
  };
}
