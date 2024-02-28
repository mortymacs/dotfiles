{ pkgs, ... }: {
  # Mount storages.
  services = { udisks2 = { enable = true; }; };

  # Backlight.
  programs = { light = { enable = true; }; };
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  # Pam.
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "4000";
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "4000";
    }
  ];
}
