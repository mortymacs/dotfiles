{
  pkgs,
  lib,
  ...
}:
let
  gvariant = lib.hm.gvariant;
in
{
  xsession.enable = false; # Prevent Xorg from being enabled

  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pano
    gnome-tweaks
    wl-clipboard
  ];

  # GTK.
  gtk = {
    enable = true;
    font = {
      name = "Adwaita Sans";
      size = 10;
    };
  };

  # dconf.
  dconf = {
    enable = true;

    settings = {
      # Background.
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///home/mort/.config/wallpaper.jpg";
        picture-uri-dark = "file:///home/mort/.config/wallpaper.jpg";
        primary-color = "#000000000000";
        secondary-color = "#000000000000";
      };
      "org/gnome/desktop/screensaver" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///home/mort/.config/wallpaper.jpg";
        primary-color = "#000000000000";
        secondary-color = "#000000000000";
      };

      # Keyboard.
      "org/gnome/desktop/input-sources" = {
        sources = [
          (gvariant.mkTuple [
            "xkb"
            "us"
          ])
          (gvariant.mkTuple [
            "xkb"
            "ir"
          ])
        ];
      };

      # Fonts.
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        color-scheme = "prefer-dark";
        document-font-name = "Adwaita Sans 11";
        font-name = "Adwaita Sans 10";
        monospace-font-name = "JetBrainsMono Nerd Font 10";
        toolkit-accessibility = false;
      };

      # Notification.
      "org/gnome/desktop/notifications" = {
        application-children = [
          "gnome-power-panel"
          "firefox"
          "teams-for-linux"
          "zoom"
          "org-gnome-fileroller"
          "org-gnome-nautilus"
          "xdg-desktop-portal-gnome"
        ];
        show-banners = true;
      };

      # Shell.
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        focus-mode = "sloppy";
      };

      "org/gnome/desktop/app-folders" = {
        folder-children = [
          "Utilities"
          "Development"
        ];
      };

      "org/gnome/desktop/app-folders/folders/Development" = {
        apps = [
          "code.desktop"
          "nvim.desktop"
          "org.kde.heaptrack.desktop"
          "com.kdab.hotspot.desktop"
          "org.kde.massif-visualizer.desktop"
          "jetbrains-toolbox.desktop"
        ];
        name = "Development";
        translate = false;
      };

      "org/gnome/desktop/app-folders/folders/Utilities" = {
        apps = [
          "nm-connection-editor.desktop"
          "org.gnome.baobab.desktop"
          "org.gnome.Logs.desktop"
          "org.gnome.Evince.desktop"
          "org.gnome.Loupe.desktop"
          "org.gnome.FileRoller.desktop"
          "yelp.desktop"
          "nixos-manual.desktop"
          "org.flameshot.Flameshot.desktop"
          "btop.desktop"
          "fish.desktop"
          "cups.desktop"
        ];
        categories = [ "X-GNOME-Utilities" ];
        excluded-apps = [
          "org.gnome.tweaks.desktop"
          "org.gnome.seahorse.Application.desktop"
        ];
        name = "Utilities";
        translate = false;
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [ ];
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "tilingshell@ferrarodomenico.com"
          "pano@elhan.io"
        ];
        favorite-apps = [
          "firefox.desktop"
        ];
      };

      # Apps.
      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "medium";
      };

      "org/gnome/TextEditor" = {
        highlight-current-line = false;
        show-grid = true;
        style-scheme = "Adwaita-dark";
        use-system-font = true;
      };

      "org/gnome/epiphany" = {
        ask-for-default = false;
      };

      "org/gnome/mutter" = {
        edge-tiling = false;
      };

      "org/gnome/tweaks" = {
        show-extensions-notice = false;
      };

      # Extension.
      "org/gnome/shell/extensions/blur-my-shell" = {
        settings-version = 2;
      };

      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        brightness = 0.6;
        sigma = 30;
      };

      "org/gnome/shell/extensions/blur-my-shell/applications" = {
        blur = false;
        whitelist = [ ];
      };

      "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = true;
        brightness = 0.6;
        pipeline = "pipeline_default_rounded";
        sigma = 30;
        static-blur = true;
        style-dash-to-dock = 0;
      };

      "org/gnome/shell/extensions/blur-my-shell/hidetopbar" = {
        compatibility = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/overview" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = 0.6;
        pipeline = "pipeline_default";
        sigma = 30;
        static-blur = true;
      };

      "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/window-list" = {
        brightness = 0.6;
        sigma = 30;
      };

      "org/gnome/shell/extensions/pano" = {
        global-shortcut = [ "<Super>c" ];
        history-length = 100;
        item-date-font-family = "Sans";
        item-date-font-size = 11;
        item-title-font-family = "Sans";
        item-title-font-size = 20;
        paste-on-select = false;
        play-audio-on-copy = false;
        search-bar-font-family = "Sans";
        search-bar-font-size = 14;
        send-notification-on-copy = false;
      };

      "org/gnome/shell/extensions/pano/color-item" = {
        metadata-font-family = "Monospace";
        metadata-font-size = 16;
      };

      "org/gnome/shell/extensions/pano/emoji-item" = {
        emoji-size = 63;
      };

      "org/gnome/shell/extensions/pano/file-item" = {
        body-font-family = "Sans";
        body-font-size = 13;
      };

      "org/gnome/shell/extensions/pano/image-item" = {
        metadata-font-family = "Sans";
        metadata-font-size = 12;
      };

      "org/gnome/shell/extensions/pano/link-item" = {
        metadata-description-font-family = "Sans";
        metadata-description-font-size = 12;
        metadata-link-font-family = "Sans";
        metadata-link-font-size = 10;
        metadata-title-font-family = "Sans";
        metadata-title-font-size = 13;
      };

      "org/gnome/shell/extensions/pano/text-item" = {
        body-font-family = "Sans";
        body-font-size = 14;
      };

      "org/gnome/shell/extensions/tilingshell" = {
        enable-autotiling = false;
        enable-blur-selected-tilepreview = false;
        enable-blur-snap-assistant = false;
        enable-smart-window-border-radius = false;
        enable-window-border = false;
        focus-window-down = [ "<Super>j" ];
        focus-window-left = [ "<Super>h" ];
        focus-window-right = [ "<Super>l" ];
        focus-window-up = [ "<Super>k" ];
        inner-gaps = lib.gvariant.mkUint32 8;
        last-version-name-installed = "15.1";
        layouts-json = ''[{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]},{"id":"209533","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.5000000000000018,"height":1,"groups":[1]}]},{"id":"27060245","tiles":[{"x":0,"y":0,"width":1,"height":0.5003543586109143,"groups":[2]},{"x":0,"y":0.5003543586109143,"width":0.5,"height":0.49964564138908574,"groups":[2,3]},{"x":0.5,"y":0.5003543586109143,"width":0.25,"height":0.24663359319631462,"groups":[2,5,4,3]},{"x":0.5,"y":0.7469879518072289,"width":0.5000000000000009,"height":0.2530120481927711,"groups":[4,3]},{"x":0.75,"y":0.5003543586109143,"width":0.25000000000000006,"height":0.24663359319631462,"groups":[2,4,5]}]},{"id":"5618632","tiles":[{"x":0,"y":0,"width":1,"height":1,"groups":[]}]}]'';
        move-window-down = [ "<Control><Super>j" ];
        move-window-left = [ "<Control><Super>h" ];
        move-window-right = [ "<Control><Super>l" ];
        move-window-up = [ "<Control><Super>k" ];
        outer-gaps = lib.gvariant.mkUint32 8;
        overridden-settings = ''{"org.gnome.mutter.keybindings":{"toggle-tiled-right":"@as []","toggle-tiled-left":"@as []"},"org.gnome.desktop.wm.keybindings":{"maximize":"['<Super>Up']","unmaximize":"['<Super>Down', '<Alt>F5']"},"org.gnome.mutter":{"edge-tiling":"false"}}'';
        restore-window-original-size = true;
        selected-layouts = [
          [ "27060245" ]
          [ "Layout 3" ]
          [ "Layout 3" ]
          [ "Layout 3" ]
        ];
        window-border-color = "rgb(10,147,150)";
        window-border-width = lib.gvariant.mkUint32 3;
      };

      # Keybinding.
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = [ ];
        begin-move = [ ];
        begin-resize = [ ];
        close = [ "<Shift><Super>q" ];
        maximize = [ ];
        minimize = [ "<Shift><Super>j" ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        move-to-workspace-1 = [ ];
        move-to-workspace-last = [ ];
        move-to-workspace-left = [ "<Shift><Control><Super>h" ];
        move-to-workspace-right = [ "<Shift><Control><Super>l" ];
        panel-run-dialog = [ ];
        switch-to-workspace-1 = [ ];
        switch-to-workspace-last = [ ];
        switch-to-workspace-left = [ "<Shift><Super>h" ];
        switch-to-workspace-right = [ "<Shift><Super>l" ];
        toggle-fullscreen = [ "<Shift><Super>f" ];
        toggle-maximized = [ "<Shift><Super>k" ];
        unmaximize = [ ];
      };

      "org/gnome/shell/keybindings" = {
        focus-active-notification = [ ];
        screenshot = [ ];
        screenshot-window = [ "<Shift><Control><Super>s" ];
        show-screen-recording-ui = [ ];
        show-screenshot-ui = [ ];
        toggle-application-view = [ ];
        toggle-message-tray = [ "<Shift><Super>n" ];
        toggle-quick-settings = [ ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
        help = [ ];
        logout = [ "<Shift><Super>e" ];
        magnifier = [ ];
        magnifier-zoom-in = [ ];
        magnifier-zoom-out = [ ];
        screenreader = [ ];
        screensaver = [ "<Shift><Super>a" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "foot";
        name = "Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Shift><Super>s";
        command = "flameshot-gui";
        name = "Screenshot";
      };
    };
  };

  xdg.configFile = {
    "wallpaper.jpg".source = ./wallpaper.jpg;
  };
}
