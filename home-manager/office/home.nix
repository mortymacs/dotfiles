# https://coolors.co/351431-eb5e55-e23e58-d81e5b-2f2f2f-151515-ececec-35c693-8136c7-8c48cc
{
  pkgs,
  inputs,
  lib,
  ...
}:
let
  defaultPackages = import ../common/packages.nix { inherit pkgs; };
in
{
  imports = [
    ../common/desktop
    ../common/fish
    ../common/starship
    ../common/terminal
    ../common/tmux
    ../common/editor
    ../common/btop
    ../common/git
    ../common/docker
    ../common/flameshot
    ../common/firefox
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
      allowUnfreePredicate = pkg: true;
    };
    overlays = [
      (final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (final) system config;
        };
      })
    ];
  };

  home.packages = with pkgs; defaultPackages.list ++ [ unstable.teams-for-linux ];

  # Fontconfig.
  fonts.fontconfig.enable = true;

  # Home manager installed version.
  home.stateVersion = "25.05";
}
