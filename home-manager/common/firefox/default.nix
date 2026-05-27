{ pkgs, lib, config, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      main = {
        name = "main";
        isDefault = true;
        containersForce = true;
      };
    };
  };
  programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
}
