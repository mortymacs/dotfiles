{ pkgs, config, ... }:
let
  modifier = config.wayland.windowManager.sway.config.modifier;
  fontSize = 11.0;
  fontName = "sans";
  gtkTheme = "Yaru-purple";
  iconTheme = "Yaru-purple";
  cursorTheme = "Yaru";
  extraConfig = {
    gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
    gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    gtk-decoration-layout = "appmenu:none";
    gtk-button-images = 1;
    gtk-menu-images = 1;
    gtk-enable-event-sounds = 0;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintfull";
    gtk-error-bell = 0;
    gtk-application-prefer-dark-theme = true;
  };
  gtk4ExtraConfig = {
    gtk-decoration-layout = "appmenu:none";
    gtk-enable-event-sounds = 0;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintfull";
    gtk-error-bell = 0;
    gtk-application-prefer-dark-theme = true;
  };
in
{
  imports = [
    ./monitor.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      startup = [
        { command = "swaybg -i '/home/mort/.config/sway/wallpaper.jpg' -m fill"; }
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
        {
          command = "systemctl --user restart kanshi.service";
          always = true;
        }
      ];
      modifier = "Mod4";

      fonts = {
        names = [
          fontName
          "monospace"
        ];
        size = fontSize;
      };

      gaps = {
        inner = 10;
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
        focusedInactive = {
          background = "#222222";
          border = "#333333";
          childBorder = "#222222";
          indicator = "#292d2e";
          text = "#888888";
        };
        urgent = {
          background = "#973c64";
          border = "#e23e58";
          childBorder = "#e23e58";
          indicator = "#e23e58";
          text = "#FFE5D4";
        };
      };

      terminal = "alacritty-fork";
      keybindings = {
        # Focus.
        "${modifier}+j" = "focus down";
        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";
        "${modifier}+k" = "focus up";

        # Workspace.
        "${modifier}+Shift+h" = "workspace prev";
        "${modifier}+Shift+l" = "workspace next";
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
        "${modifier}+Ctrl+v" = "splith";
        "${modifier}+Ctrl+s" = "splitv";
        "${modifier}+Shift+Up" = "fullscreen toggle global";

        # Move.
        "${modifier}+Shift+Ctrl+l" = "exec move-to-next-workspace";
        "${modifier}+Shift+Ctrl+h" = "move to workspace prev";
        "${modifier}+Shift+Alt+h" = "move left";
        "${modifier}+Shift+Alt+l" = "move right";

        # Action.
        "${modifier}+Shift+a" = "exec swaylock -c '0f111b' -e -F";
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
        "${modifier}+Return" = "exec alacritty-fork";
        "${modifier}+Shift+s" = "exec flameshot gui";
      };

      window.border = 1;

      bars = [
        {
          fonts = {
            names = [
              fontName
              "monospace"
            ];
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
            statusline = "#FFE5D4";
            focusedWorkspace = {
              background = "#1d4e89";
              border = "#1d4e89";
              text = "#FFE5D4";
            };
            activeWorkspace = {
              background = "#161927";
              border = "#161927";
              text = "#FFE5D4";
            };
            inactiveWorkspace = {
              background = "#161927";
              border = "#161927";
              text = "#FFE5D4";
            };
            urgentWorkspace = {
              background = "#973c64";
              border = "#e23e58";
              text = "#FFE5D4";
            };
          };
        }
      ];
    };

    extraConfig = ''
      default_border pixel
    '';
  };

  # Status bar.
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
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
            format = "NL $timestamp.datetime(f:'%a %d/%m %R') ";
            timezone = "Europe/Amsterdam";
            interval = 10;
          }
          {
            block = "net";
            format = " {$signal_strength $ssid} $icon ";
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

  # GTK.
  gtk = {
    enable = true;
    theme.name = gtkTheme;
    iconTheme.name = iconTheme;
    cursorTheme.name = cursorTheme;
    font = {
      name = "Lexend";
      size = 10;
    };
    gtk3.extraConfig = extraConfig;
    gtk4.extraConfig = gtk4ExtraConfig;
  };

  # Custom settings.
  home.file = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Inherits=${cursorTheme}
    '';
  };

  # XDG.
  xdg.configFile = {
    # Wallpaper.
    "sway/wallpaper.jpg".source = ./wallpaper.jpg;
    # Rofi.
    "rofi/config.rasi".source = ./config.rasi;
    "rofi/themes/custom.rasi".source = ./theme.rasi;
  };

  # Clipboard.
  services = {
    cliphist = {
      enable = true;
      systemdTargets = [ "way-session.target" ];
    };
  };

  # Packages.
  home.packages = with pkgs; [
    swaylock
    swayidle
    swaybg
    wdisplays
    wayland
    wl-clipboard
    rofi-wayland
    yaru-theme
    (writeShellScriptBin "exit-action" (builtins.readFile ./exit-action.sh))
    (writeShellScriptBin "move-to-next-workspace" (builtins.readFile ./move-to-next-workspace.sh))
  ];
}
