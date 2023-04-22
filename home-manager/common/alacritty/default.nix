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
        decorations = "full";
        dynamic_padding = false;
        padding = {
          x = 0;
          y = 0;
        };
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
          blink_interval = 100;
          vi_mode_style = "Beam";
        };
      };

      mouse = {
        hide_when_typing = true;
      };

      selection = {
        save_to_clipboard = true;
      };

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

      # https://github.com/pineapplegiant/spaceduck-terminal
      # Space Duck
      colors = {
        # Default colors
        primary = {
          background = "#060606";
          foreground = "#ecf0c1";
        };

        cursor = {
          cursor = "#4B3F72";
        };

        selection = {
          text = "#ecf0c1";
          background = "#1F2041";
        };

        # Normal colors
        normal = {
          black = "#000000";
          red = "#e33400";
          green = "#5ccc96";
          yellow = "#b3a1e6";
          blue = "#00a3cc";
          magenta = "#f2ce00";
          cyan = "#7a5ccc";
          white = "#686f9a";
        };
        # Bright colors
        bright = {
          black = "#686f9a";
          red = "#e33400";
          green = "#5ccc96";
          yellow = "#b3a1e6";
          blue = "#00a3cc";
          magenta = "#f2ce00";
          cyan = "#7a5ccc";
          white = "#f0f1ce";
        };
      };
    };
  };
}
