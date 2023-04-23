# https://coolors.co/351431-eb5e55-e23e58-d81e5b-2f2f2f-151515-ececec-35c693-8136c7-8c48cc
{ config, pkgs, outputs, inputs, ... }:
{
  imports = [
    ../common/bspwm
    ../common/polybar
    ../common/sxhkd
    ../common/dunst
    ../common/gtk
    ../common/picom
    ./zsh
    ../common/starship
    ../common/rofi
    ../common/terminal
    ../common/tmux
    ../common/tmuxp
    ../common/fzf
    ../common/peco
    ../common/nvim
    ../common/btop
    ../common/git
    ../common/docker
    ../common/flameshot
    ../common/misc
  ];

  # User home.
  home = {
    username = "mort";
    homeDirectory = "/home/mort";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Config packages.
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
    teams

    # Music.
    spotify

    # Security.
    xss-lock
    xsecurelock

    # Misc.
    xclip
    trash-cli
    gnome.zenity
    networkmanagerapplet
    duf
    dog
    gping

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

    # Process.
    procs
    kmon
    bmon

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
    nodePackages.yaml-language-server
    jetbrains.phpstorm
  ];

  # Fontconfig.
  fonts.fontconfig.enable = true;

  # Home manager version.
  home.stateVersion = "22.11";
}
