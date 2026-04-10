{
  pkgs,
  lib,
  config,
  ...
}:
let
  gvariant = lib.hm.gvariant;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.static-workspace-background
    gnome-tweaks
    wl-clipboard
    folio
    dconf-editor
    bustle
    newsflash
    gradia
    libheif
    libheif.out
  ];

  # GTK.
  gtk = {
    enable = true;
    font = {
      name = "Sans";
      size = 12;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
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
        document-font-name = "Adwaita Sans 1s";
        monospace-font-name = "CodeNewRoman Nerd Font 14";
        toolkit-accessibility = false;
      };

      # Notification.
      "org/gnome/desktop/notifications" = {
        application-children = [
          "gnome-power-panel"
          "firefox"
          "ghostty"
          "org-gnome-fileroller"
          "org-gnome-nautilus"
        ];
        show-banners = true;
      };

      # Shell.
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,close";
        focus-mode = "sloppy";
      };

      "org/gnome/desktop/app-folders" = {
        folder-children = [
          "Utilities"
          "Development"
        ];
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [ ];
        enabled-extensions = with pkgs; [
          gnomeExtensions.appindicator.extensionUuid
          gnomeExtensions.tiling-shell.extensionUuid
          gnomeExtensions.blur-my-shell.extensionUuid
          gnomeExtensions.clipboard-indicator.extensionUuid
          gnomeExtensions.alphabetical-app-grid.extensionUuid
          gnomeExtensions.static-workspace-background.extensionUuid
        ];
        favorite-apps = [
          "firefox.desktop"
          "io.gitlab.news_flash.NewsFlash.desktop"
          "com.mitchellh.ghostty.desktop"
          "com.toolstack.Folio.desktop"
          "org.gnome.TextEditor.desktop"
          "org.gnome.Nautilus.desktop"
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
        auto-hide-search = false;
        clipboard-orientation = "horizontal";
        clipboard-position-horizontal = "fill";
        clipboard-position-vertical = "bottom";
        clipboard-size = 500;
        history-length = 100;
        open-clipboard-dialog-shortcut = [ "<Super>c" ];
      };

      "org/gnome/shell/extensions/tilingshell" = {
        enable-autotiling = false;
        enable-blur-selected-tilepreview = false;
        enable-blur-snap-assistant = false;
        enable-smart-window-border-radius = false;
        enable-window-border = false;
        focus-window-down = [
          "<Super>j"
          "<Super>Down"
        ];
        focus-window-left = [
          "<Super>h"
          "<Super>Left"
        ];
        focus-window-right = [
          "<Super>l"
          "<Super>Right"
        ];
        focus-window-up = [
          "<Super>k"
          "<Super>Up"
        ];
        inner-gaps = lib.gvariant.mkUint32 8;
        layouts-json = ''[{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]},{"id":"209533","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.5000000000000018,"height":1,"groups":[1]}]},{"id":"27060245","tiles":[{"x":0,"y":0,"width":1,"height":0.5003543586109143,"groups":[2]},{"x":0,"y":0.5003543586109143,"width":0.5,"height":0.49964564138908574,"groups":[2,3]},{"x":0.5,"y":0.5003543586109143,"width":0.25,"height":0.24663359319631462,"groups":[2,5,4,3]},{"x":0.5,"y":0.7469879518072289,"width":0.5000000000000009,"height":0.2530120481927711,"groups":[4,3]},{"x":0.75,"y":0.5003543586109143,"width":0.25000000000000006,"height":0.24663359319631462,"groups":[2,4,5]}]},{"id":"5618632","tiles":[{"x":0,"y":0,"width":1,"height":1,"groups":[]}]}]'';
        move-window-down = [
          "<Control><Super>j"
          "<Control><Super>Down"
        ];
        move-window-left = [
          "<Control><Super>h"
          "<Control><Super>Left"
        ];
        move-window-right = [
          "<Control><Super>l"
          "<Control><Super>Right"
        ];
        move-window-up = [
          "<Control><Super>k"
          "<Control><Super>Up"
        ];
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
        minimize = [
          "<Shift><Super>j"
          "<Shift><Super>Down"
        ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        move-to-workspace-1 = [ ];
        move-to-workspace-last = [ ];
        move-to-workspace-left = [
          "<Shift><Control><Super>h"
          "<Shift><Control><Super>Left"
        ];
        move-to-workspace-right = [
          "<Shift><Control><Super>l"
          "<Shift><Control><Super>Right"
        ];
        panel-run-dialog = [ ];
        switch-to-workspace-1 = [ ];
        switch-to-workspace-last = [ ];
        switch-to-workspace-left = [
          "<Shift><Super>h"
          "<Shift><Super>Left"
        ];
        switch-to-workspace-right = [
          "<Shift><Super>l"
          "<Shift><Super>Right"
        ];
        toggle-fullscreen = [ "<Shift><Super>f" ];
        toggle-maximized = [
          "<Shift><Super>k"
          "<Shift><Super>Up"
        ];
        unmaximize = [ ];
      };

      "org/gnome/shell/keybindings" = {
        focus-active-notification = [ ];
        screenshot = [ ];
        screenshot-window = [ ];
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
        command = "ghostty";
        name = "Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Shift><Super>s";
        command = "gradia --screenshot";
        name = "Screenshot";
      };

    };
  };

  xdg.configFile = {
    "wallpaper.jpg".source = ./wallpaper.jpg;
  };
}
