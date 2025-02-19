{ pkgs, ... }:
{
  security.polkit.enable = true;
  services.dbus.enable = true;

  # Config QT applications.
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
    updateDbusEnvironment = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];

  environment.gnome.excludePackages = (
    with pkgs;
    [
      atomix
      cheese
      snapshot
      geary
      gedit
      gnome-screenshot
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-contacts
      gnome-calendar
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
