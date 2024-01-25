{ pkgs, ... }: {

  #home.packages = with pkgs;
  #   [
  #     (st.overrideAttrs (oldAttrs: rec {
  #       configFile =
  #         writeText "config.def.h" (builtins.readFile ./config.def.h);
  #       patches = [
  #         ./st-vertcenter-20231003-eb3b894.diff
  #         ./st-charoffsets-20220311-0.8.5.diff
  #         ./st-dynamic-cursor-color-0.9.diff
  #       ];
  #       postPatch = ''
  #         ${oldAttrs.postPatch}
  #          cp ${configFile} config.def.h'';
  #     }))
  #   ];

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
        TERM = "xterm-256color";
      };
      window = {
        opacity = 0.99;
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
        };
        vi_mode_style = {
          shape = "Beam";
          blinking = "Always";
        };
      };

      mouse = { hide_when_typing = true; };

      selection = { save_to_clipboard = true; };

      font = {
        size = 13;

        normal = { style = "Medium"; };

        offset = {
          x = 0;
          y = 5;
        };

        glyph_offset = {
          x = 0;
          y = 3;
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
