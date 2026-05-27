{
  # Power management.
  services.power-profiles-daemon.enable = true;

  # SSD optimization.
  services.fstrim.enable = true;

  # Documentation.
  documentation.nixos.enable = true;
  documentation.man.enable = true;
}
