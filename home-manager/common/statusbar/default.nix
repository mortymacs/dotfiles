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
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
        settings = {
          theme = {
            theme = "modern";
            overrides = {
              idle_bg = "#0f111b";
              idle_fg = "#ECECEC";
            };
          };
        };
      };
    };
  };
}
