# Colors: https://coolors.co/82264f-ee6352-27213c-554884
let
  focused_border_color = "#554884";
  normal_border_color = "#27213C";
  active_border_color = "#27213C";
  presel_feedback_color = "#27213C";
in {
  xsession.windowManager = {
    bspwm = {
      enable = true;
      settings = {
        window_gap = 6;
        border_width = 1;
        focused_border_color = "${focused_border_color}";
        normal_border_color = "${normal_border_color}";
        active_border_color = "${active_border_color}";
        presel_feedback_color = "${presel_feedback_color}";
        borderless_monocle = true;
        gapless_monocle = true;
        focus_follows_pointer = true;
      };
      extraConfig = ''
        bspc monitor -d 0 1 2 3 4 5
        bspc monitor DP-1 -d 0 1 2 3 4 5
        bspc monitor HDMI-1 -d 0 1 2 3 4 5
      '';

      startupPrograms = [
        # Network.
        "nm-applet"

        # Bar.
        "polybar main --log=error"

        # Keybinding.
        "pgrep -x sxhkd > /dev/null || sxhkd"

        # Background.
        "feh --bg-fill ~/.config/bspwm/wallpaper.jpg"

        # Mouse.
        "xsetroot -cursor_name arrow"

        # Lock screen.
        "xset s 180"
        "xss-lock --transfer-sleep-lock -- 'XSECURELOCK_FONT=sans xsecurelock'"
      ];
    };
  };

  xdg.configFile = {
    # Wallpaper.
    "bspwm/wallpaper.jpg".source = ./wallpaper.jpg;
  };
}
