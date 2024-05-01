{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "cpu";
            interval = 1;
          }
          { block = "sound"; }
          { block = "battery"; }
          {
            block = "toggle";
            command_state = "makoctl mode | grep do-not";
            command_on = "makoctl mode -s do-not-disturb";
            command_off = "makoctl mode -r do-not-disturb";
            icon_on = "toggle_on";
            icon_off = "toggle_off";
            format = "$icon";
            interval = 1;
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
        settings = {
          theme = {
            theme = "native";
            overrides = {
              idle_fg = "#ECECEC";
              separator = " ";
              separator_fg = "#292948";
            };
          };
        };
      };
    };
  };
}
