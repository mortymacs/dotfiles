{ pkgs, ... }:
{
  security.polkit.enable = true;
  programs.light.enable = true;
  services.dbus.enable = true;

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.displayManager.ly = {
    enable = true;
    x11Support = false;
    settings = {
      session_log = null;
    };
  };

  programs.ssh = {
    startAgent = true;
  };
}
