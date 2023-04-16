{
  services.picom = {
    enable = true;
    backend = "glx";
    shadow = true;
    activeOpacity = 0.9;
    inactiveOpacity = 0.9;
    shadowExclude = [
      "window_type *= 'menu'"
      "focused = 1"
    ];
  };
}
