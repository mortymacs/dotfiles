{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
        TERM = "xterm-256color";
      };
      window = {
        opacity = 0.9;
        decorations = "none";
        dynamic_padding = false;
        padding = {
          x = 0;
          y = 0;
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
        size = 12;

        offset = {
          x = 0;
          y = 0;
        };

        glyph_offset = {
          x = 0;
          y = 0;
        };
      };

      # https://github.com/alacritty/alacritty-theme/
      # Ayu + my customization.
      colors = {
        # Default colors
        primary = {
          background = "#0A0E14";
          foreground = "#FEFADC";
        };

        cursor = { cursor = "#344866"; };

        selection = {
          text = "#FEFADC";
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
