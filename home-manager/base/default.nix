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
    ../common/packages.nix
  ];

  # User home.
  home = {
    username = "mort";
    homeDirectory = "/home/mort";
    stateVersion = "25.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Fontconfig.
  fonts.fontconfig.enable = true;
}
