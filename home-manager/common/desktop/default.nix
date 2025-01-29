{
  pkgs,
  config,
  lib,
  ...
}:
let
  # https://discourse.nixos.org/t/how-to-config-the-gnome-app-picker-layout-correctly/36159/2
  apl-entry =
    with lib.hm.gvariant;
    name:
    (
      position:
      (mkDictionaryEntry [
        name
        (mkVariant [
          (mkDictionaryEntry [
            "position"
            (mkVariant position)
          ])
        ])
      ])
    );
in
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnome-tweaks
    wl-clipboard
    unstable.todoist-electron
  ];

  # GTK.
  gtk = {
    enable = true;
    font = {
      name = "Lexend";
      size = 10;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/background" = {
        "picture-uri" = "file:///home/mort/.config/wallpaper.jpg";
        "picture-uri-dark" = "file:///home/mort/.config/wallpaper.jpg";
        "picture-options" = "zoom";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        focus-mode = "sloppy";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Todo.desktop"
        ];
        "org/gnome/desktop/app-folders" = [
          [
            (apl-entry "Development" 0)
            (apl-entry "Misc" 1)
          ]
        ];
        "org/gnome/desktop/app-folders/folders/Development" = [
          [
            (apl-entry "clion.desktop" 0)
            (apl-entry "datagrip.desktop" 1)
            (apl-entry "goland.desktop" 2)
            (apl-entry "pycharm-professional.desktop" 3)
            (apl-entry "code.desktop" 4)
            (apl-entry "nvim.desktop" 5)
            (apl-entry "org.kde.heaptrack.desktop" 6)
            (apl-entry "com.kdab.hotspot.desktop" 7)
            (apl-entry "org.kde.massif-visualizer.desktop" 8)
          ]
        ];
        app-picker-layout = [
          [
            (apl-entry "org.gnome.Nautilus.desktop" 0)
            (apl-entry "Alacritty.desktop" 1)
            (apl-entry "Zoom.desktop" 2)
            (apl-entry "teams-for-linux.desktop" 3)
            (apl-entry "gimp.desktop" 4)
            (apl-entry "org.gnome.clocks.desktop" 5)
            (apl-entry "org.gnome.Calculator.desktop" 6)
            (apl-entry "org.gnome.SystemMonitor.desktop" 7)
            (apl-entry "org.gnome.tweaks.desktop" 8)
            (apl-entry "org.gnome.Settings.desktop" 9)
            (apl-entry "org.gnome.Extensions.desktop" 10)
            (apl-entry "org.gnome.seahorse.Application.desktop" 11)
            (apl-entry "Utilities" 12)
            (apl-entry "Development" 13)
          ]
        ];
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "GPaste@gnome-shell-extensions.gnome.org"
          "blur-my-shell@aunetx"
        ];
        disabled-extensions = [ ];
      };
      "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Open Alacritty";
        binding = "<Super>Return";
        command = "alacritty";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Screenshot";
        binding = "<Super><Shift>S";
        command = "flameshot gui";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
      };
    };
  };

  xdg.configFile = {
    # Wallpaper.
    "wallpaper.jpg".source = ./wallpaper.jpg;
  };
}
