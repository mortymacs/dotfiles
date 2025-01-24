{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-assistant
    gnomeExtensions.blur-my-shell
    gnome-tweaks
    endeavour
    wl-clipboard
  ];

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
      };
      "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Open Alacritty";
        binding = "<Super>Return";
        command = "alacritty";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
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
