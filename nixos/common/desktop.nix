{ pkgs, ... }:
{
  security.polkit.enable = true;
  services.dbus.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.gpaste.enable = true;

  environment.gnome.excludePackages = (
    with pkgs;
    [
      atomix
      cheese
      snapshot
      epiphany
      geary
      gedit
      gnome-screenshot
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-contacts
      gnome-connections
      gnome-maps
      gnome-disk-utility
      gnome-font-viewer
      gnome-browser-connector
      gnome-console
      gnome-weather
      gnome-user-docs
      gnome-tour
      simple-scan
      hitori
      iagno
      tali
      totem
    ]
  );

}
