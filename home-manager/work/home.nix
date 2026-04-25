{ pkgs, ... }:
{
  imports = [
    ../base
    ./misc
  ];

  home.packages = with pkgs; [
    unstable.teams-for-linux
    unstable.github-copilot-cli
    unstable.copilot-language-server
  ];
}
