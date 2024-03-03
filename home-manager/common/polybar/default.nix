{ pkgs, ... }:
let
  # Body.
  background = "#0f111b";
  foreground = "#ECECEC";
  border-bottom = "#27213C";
  disabled = "#413c58";

  # Workspace.
  active-workspace-background = "#161927";
  urgent-workspace-background = "#82264F";
  empty-workspace-foreground = "#707880";

  # Datetime.
  main-timezone-foreground = "#ECECEC";
  second-timezone-foreground = "#ECECEC";

  # Location.
  main-location-foreground = "#ffbe0b";
  second-location-foreground = "#fb5607";
in {
  services.polybar = {
    enable = true;
    config = {
      "global/wm" = {
        margin-top = 0;
        margin-bottom = 0;
        dpi = 100;
        padding-left = 0;
        padding-right = 0;
      };

      "bar/main" = {
        width = "100%";
        height = "20pt";
        radius = 0;
        background = "${background}";
        foreground = "${foreground}";
        line-size = "3pt";
        module-margin = 0;
        separator = " | ";
        separator-foreground = "${disabled}";
        font-0 = "Lexend:size=10;2";
        font-1 = "Noto Color Emoji:scale=10;2";
        modules-left = "bspwm";
        modules-right =
          "backlight speaker tor_location system_location ir_date date ipc-dunst battery menu-apps";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = true;
        tray-position = "right";
        wm-restack = "bspwm";
        override-redirect = false;
        border-bottom-size = 1;
        border-bottom-color = "${border-bottom}";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        enable-scroll = false;
        reverse-scroll = false;
        label-active = "%name%";
        label-active-background = "${active-workspace-background}";
        label-active-padding = 2;
        label-occupied = "%name%";
        label-occupied-padding = 2;
        label-urgent = "%name%";
        label-urgent-background = "${urgent-workspace-background}";
        label-urgent-padding = 2;
        label-empty = "%name%";
        label-empty-foreground = "${empty-workspace-foreground}";
        label-empty-padding = 2;
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";
        use-actual-brightness = true;
        enable-scroll = true;
        format-prefix = "🪔 ";
        label = "%percentage%%";
      };

      "module/speaker" = {
        type = "custom/script";
        label = "📢 %output%";
        interval = 1;
        exec = "pamixer --get-volume-human";
        click-left = "pamixer --toggle-mute && pamixer --get-volume-human";
        scroll-up = "pamixer --increase 1 && pamixer --get-volume-human";
        scroll-down = "pamixer --decrease 1 && pamixer --get-volume-human";
      };

      "module/system_location" = {
        type = "custom/script";
        exec =
          "echo $(curl -s http://ip-api.com/json --connect-timeout 5 | jq -r '.countryCode')";
        interval = 30;
        format-foreground = "${main-location-foreground}";
      };

      "module/tor_location" = {
        type = "custom/script";
        exec =
          "echo $(curl -s -x http://127.0.0.1:8118 http://ip-api.com/json --connect-timeout 5 | jq -r '.countryCode' 2>/dev/null)";
        interval = 30;
        format-foreground = "${second-location-foreground}";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%a %d/%m %R";
        label = "%date%";
        format-foreground = "${main-timezone-foreground}";
      };

      "module/ir_date" = {
        type = "custom/script";
        exec = "TZ=Asia/Tehran date '+%R'";
        interval = 1;
        format-foreground = "${second-timezone-foreground}";
      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 100;
        low-at = 10;
        battery = "BAT0";
        adapter = "ADP1";
        poll-interval = 5;
        label-charging = "%{F#5ccc96}%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "%{F#5ccc96}FULL";
        label-low = "%{F#e33400}%percentage%%";
      };

      # https://github.com/sagotsky/.dotfiles/blob/master/config/polybar/config
      "module/ipc-dunst" = {
        type = "custom/ipc";
        initial = 1;
        hook-0 = ''
          echo "%{A1:dunstctl set-paused true && polybar-msg hook ipc-dunst 2:}🔔%{A}" &'';
        hook-1 = ''
          echo "%{A1:dunstctl set-paused false && polybar-msg hook ipc-dunst 1:}%{F#ff2200}🔕%{F-}%{A}" &'';
      };

      "module/menu-apps" = {
        type = "custom/menu";
        expand-right = true;
        label-open = "➕";
        label-close = "➖ ";
        menu-0-0 = "Shutdown |";
        menu-0-0-exec =
          "GTK_THEME=Yaru-purple-dark zenity --question --title 'shutdown' --text 'shutdown now?' && shutdown now";
        menu-0-1 = " Restart";
        menu-0-1-exec =
          "GTK_THEME=Yaru-purple-dark zenity --question --title 'restart' --text 'restart now?' && reboot";
      };

    };
    script = "polybar main --log=error &";
  };
}
