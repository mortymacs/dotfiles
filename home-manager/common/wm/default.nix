{ pkgs, config, ... }:
let
  modifier = config.wayland.windowManager.sway.config.modifier;
  fontSize = 11.0;
  fontName = "sans";
in {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      startup = [
        { command = "swaybg -c '#0a0908'"; }
        {
          command = ''
            swayidle -w \
            timeout 300 'swaylock -f -c #0f111b' \
            timeout 600 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' \
            before-sleep 'swaylock -f -c #0f111b'
          '';
        }
        { command = "mako"; }
        { command = "nm-applet"; }
      ];
      modifier = "Mod4";

      fonts = {
        names = [ fontName ];
        size = fontSize;
      };

      colors = {
        background = "#242423";
        focused = {
          background = "#27213C";
          border = "#554884";
          childBorder = "#554884";
          indicator = "#554884";
          text = "#FFE5D4";
        };
        unfocused = {
          background = "#222222";
          border = "#333333";
          childBorder = "#222222";
          indicator = "#292d2e";
          text = "#888888";
        };
      };

      terminal = "wezterm";
      keybindings = {
        # Focus.
        "${modifier}+Down" = "focus down";
        "${modifier}+Left" = "focus left";
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";

        # Workspace.
        "${modifier}+Shift+Left" = "workspace prev";
        "${modifier}+Shift+Right" = "workspace next";
        "${modifier}+Shift+0" = "workspace number 0";
        "${modifier}+Shift+1" = "workspace number 1";
        "${modifier}+Shift+2" = "workspace number 2";
        "${modifier}+Shift+3" = "workspace number 3";
        "${modifier}+Shift+4" = "workspace number 4";
        "${modifier}+Shift+5" = "workspace number 5";

        # Layout.
        "${modifier}+n" = "layout toggle split";
        "${modifier}+s" = "layout stacking";
        "${modifier}+t" = "layout tabbed";

        # Action.
        "${modifier}+l" = "exec swaylock -c '0f111b' -e -F";
        "${modifier}+Shift+r" = "reload";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+e" = "exec exit-action | xargs swaymsg exec --";

        # Launcher.
        "${modifier}+d" = "exec rofi -show run | xargs swaymsg exec --";
        "${modifier}+c" =
          "exec cliphist list | rofi -dmenu | cliphist decode | wl-copy | xargs swaymsg exec --";
        "${modifier}+Tab" = "exec rofi -show window | xargs swaymsg exec --";

        # Application.
        "${modifier}+w" = "exec firefox";
        "${modifier}+Return" = "exec wezterm";
        "${modifier}+Shift+s" = "exec flameshot gui";
      };

      window.border = 1;

      bars = [{
        fonts = {
          names = [ fontName ];
          size = fontSize;
        };
        mode = "dock";
        hiddenState = "hide";
        position = "top";
        workspaceButtons = true;
        workspaceNumbers = false;
        trayOutput = "*";
        statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
        colors = {
          background = "#0f111b";
          statusline = "#ECECEC";
          focusedWorkspace = {
            background = "#1d4e89";
            border = "#1d4e89";
            text = "#ECECEC";
          };
          activeWorkspace = {
            background = "#161927";
            border = "#161927";
            text = "#ECECEC";
          };
          inactiveWorkspace = {
            background = "#161927";
            border = "#161927";
            text = "#ECECEC";
          };
          urgentWorkspace = {
            background = "#82264F";
            border = "#82264F";
            text = "#ECECEC";
          };
        };
      }];
    };
  };

  xdg.configFile = {
    # Wallpaper.
    "sway/wallpaper.jpg".source = ./wallpaper.jpg;
  };

  home.packages = with pkgs;
    [
      (writeShellScriptBin "exit-action" (builtins.readFile ./exit-action.sh))
    ];
}