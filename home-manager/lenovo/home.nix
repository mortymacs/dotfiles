{
  pkgs,
  inputs,
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
          system = final.stdenv.hostPlatform.system;
          inherit (final) config;
        };
      })
    ];
  };

  home.packages = with pkgs; defaultPackages.list ++ [ ];

  # Fontconfig.
  fonts.fontconfig.enable = true;

  # Home manager installed version.
  home.stateVersion = "25.11";
}
