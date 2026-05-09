{
  # Backlight.
  programs = {
    light = {
      enable = true;
    };
  };

  # Pam.
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "10000";
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "10000";
    }
  ];

  # Power management.
  services.power-profiles-daemon.enable = true;

  # SSD optimization.
  services.fstrim.enable = true;

  # Documentation.
  documentation.nixos.enable = true;
  documentation.man.enable = true;
}
