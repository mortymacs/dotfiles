# https://coolors.co/351431-eb5e55-e23e58-d81e5b-2f2f2f-151515-ececec-35c693-8136c7-8c48cc
{ config, pkgs, outputs, inputs, ... }:
let defaultPackages = import ../common/packages.nix { inherit pkgs; };
in {
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

  home.packages = with pkgs;
    defaultPackages.list ++ [
      # Meeting.
      unstable.teams-for-linux
    ];

  # Fontconfig.
  fonts.fontconfig.enable = true;

  # Home manager installed version.
  home.stateVersion = "22.11";
}
