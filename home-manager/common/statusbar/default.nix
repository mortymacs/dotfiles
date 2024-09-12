{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "music";
            format = " 󰓇 {$title $prev $play $next |}";
            player = "spotify";
          }
          {
            block = "cpu";
            interval = 1;
            format = "   $utilization ";
          }
          {
            block = "backlight";
            format = " 󰤔  $brightness ";
          }
          {
            block = "sound";
            format = " 󰓃 {$volume.eng(w:2) |}";
          }
          {
            block = "battery";
            format = " 󰄌  $percentage ";
          }
          {
            block = "toggle";
            command_state = "makoctl mode | grep do-not";
            command_on = "makoctl mode -s do-not-disturb";
            command_off = "makoctl mode -r do-not-disturb";
            icon_on = "toggle_on";
            icon_off = "toggle_off";
            format = " $icon ";
            interval = 1;
          }
          {
            block = "time";
            format = "IR $timestamp.datetime(f:'%a %d/%m %R')";
            timezone = "Asia/Tehran";
            interval = 10;
          }
          {
            block = "time";
            format = "NL $timestamp.datetime(f:'%a %d/%m %R') ";
            timezone = "Europe/Amsterdam";
            interval = 10;
          }
        ];
        settings = {
          icons = {
              icons = "material-nf";
          };
          theme = {
            theme = "native";
            overrides = {
              idle_fg = "#ECECEC";
              separator = "│";
              separator_fg = "#292948";
            };
          };
        };
      };
    };
  };
}
