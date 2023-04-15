let
  focused_border_color = "#8136C7";
  normal_border_color = "#2F2F2F";
  active_border_color = "#2F2F2F";
  presel_feedback_color = "#2F2F2F";
in
{
  xsession.windowManager = {
    bspwm = {
      enable = true;
      settings = {
        monitor = "0 1 2 3 4";
        window_gap = 3;
        border_width = 1;
        focused_border_color = "${focused_border_color}";
        normal_border_color = "${normal_border_color}";
        active_border_color = "${active_border_color}";
        presel_feedback_color = "${presel_feedback_color}";
        split_ratio = 0.52;
        borderless_monocle = true;
        gapless_monocle = true;
        focus_follows_pointer = false;
      };

      startupPrograms = [
        # Network.
        "nm-applet"

        # Bar.
        "polybar main --log=error"

        # Keybinding.
        "pgrep -x sxhkd > /dev/null || sxhkd"

        # Background.
        "feh --bg-fill ~/.config/bspwm/wallpaper.svg"

        # Mouse.
        "xsetroot -cursor_name dot"

        # Lock screen.
        "xset s 180"
        "xss-lock --transfer-sleep-lock -- xsecurelock"
      ];
      rules = {
        "firefox" = {
          desktop = "0";
        };
        "Microsoft\ Teams\ -\ Preview:\*" = {
          desktop = "0";
          split_ratio = "0.61";
        };
      };
    };
  };

  xdg.configFile = {
    # Wallpaper.
    "bspwm/wallpaper.svg".source = ./wallpaper.svg;
  };
}
