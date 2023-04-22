# https://coolors.co/351431-eb5e55-e23e58-d81e5b-2f2f2f-151515-ececec-35c693-8136c7-8c48cc
{ config, pkgs, outputs, inputs, ... }:
{
  imports = [
    ../common/bspwm
    ../common/polybar
    ../common/sxhkd
    ../common/picom
    ../common/zsh
    ../common/starship
    ../common/rofi
    ../common/terminal
    ../common/tmux
    ../common/fzf
    ../common/nvim
    ../common/btop
    ../common/git
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "mort";
    homeDirectory = "/home/mort";
  };

  # Home manager version.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (pkgs: true);
      joypixels.acceptLicense = true;
    };
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          system = final.system;
          config.allowUnfree = true;
        };
      })
    ];
  };

  home.packages = with pkgs; [
    # Application.
    firefox

    # Text.
    bat
    ripgrep-all
    pwgen
    peco
    most
    fd
    jq
    yq

    # Meeting.
    zoom-us

    # Music.
    spotify

    # Security.
    xsecurelock

    # Misc.
    xclip
    trash-cli
    gnome.zenity
    networkmanagerapplet
    duf
    dog

    # File and directory.
    fzf
    broot
    exa
    zoxide
    feh
    file

    # Font.
    joypixels

    # Theme.
    yaru-theme

    # Cloud / virtualization.
    terraform
    kubecolor
    kubectx
    kind
    stern
    helm
    awscli2
    ctop

    # Database.
    pgcli
    mycli

    # Development.
    delve
    go-tools
    revive
    gosec
    gomodifytags
    golangci-lint
    gofumpt
    terraform-docs
    shellcheck
    zeal
    ghq
    insomnia
    httpie
    hugo
    tokei

    # Programming.
    gcc
    go
    gopls
    sumneko-lua-language-server
    terraform-ls
    rnix-lsp
  ];

  services = {
    flameshot = {
      enable = true;
      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          checkForUpdates = false;
        };
      };
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          font = "Lexend 10";
          markup = "full";
          frame_width = 1;
          frame_color = "#7a5ccc";
          corner_radius = 0;
          gap_size = 1;
          icon_theme = "Arc";
        };
        urgency_low = {
          background = "#0f111b";
          foreground = "#b3a1e6";
          timeout = 10;
        };
        urgency_normal = {
          background = "#0f111b";
          foreground = "#ecf0c1";
          timeout = 10;
        };
        urgency_critical = {
          background = "#0f111b";
          foreground = "#ce6f8f";
          frame_color = "#B93C89";
          timeout = 0;
        };
      };
    };
    udiskie = {
      enable = true;
    };
  };

  fonts.fontconfig.enable = true;
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-purple-dark";
    };
    theme = {
      name = "Yaru-purple-dark";
    };
    gtk3 = {
      extraConfig = {
        gtk-theme-name = "Yaru-purple-dark";
        gtk-icon-theme-name = "Yaru-purple-dark";
        gtk-font-name = "Lexend 10";
        gtk-cursor-theme-name = "Yaru";
        gtk-cursor-theme-size = 0;
        gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 1;
        gtk-menu-images = 1;
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-error-bell = 0;
      };
    };
  };
}
