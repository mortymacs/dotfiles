{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
        TERM = "xterm-256color";
      };
      window = {
        opacity = 1.0;
        decorations = "none";
        dynamic_padding = false;
        padding = {
          x = 5;
          y = 5;
        };
        decorations_theme_variant = "Dark";
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
          blink_interval = 100;
          vi_mode_style = "Beam";
        };
      };

      mouse = { hide_when_typing = true; };

      selection = { save_to_clipboard = true; };

      font = {
        size = 11.5;

        offset = {
          x = 0;
          y = 7;
        };

        glyph_offset = {
          x = 0;
          y = 5;
        };
      };

      # https://github.com/alacritty/alacritty-theme/
      # Ayu + my customization.
      colors = {
        # Default colors
        primary = {
          background = "#0B1015";
          foreground = "#FCFCFC";
        };

        cursor = { cursor = "#344866"; };

        selection = {
          text = "#FCFCFC";
          background = "#202C3E";
        };

        # Normal colors
        normal = {
          black = "#686868";
          red = "#EA6C73";
          green = "#91B362";
          yellow = "#F9AF4F";
          blue = "#53BDFA";
          magenta = "#FAE994";
          cyan = "#90E1C6";
          white = "#C7C7C7";
        };
        # Bright colors
        bright = {
          black = "#686868";
          red = "#F07178";
          green = "#C2D94C";
          yellow = "#FFB454";
          blue = "#59C2FF";
          magenta = "#FFEE99";
          cyan = "#95E6CB";
          white = "#FFFFFF";
        };
      };
    };
  };
}
