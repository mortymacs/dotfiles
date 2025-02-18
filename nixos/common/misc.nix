{ pkgs, ... }: {
  # Backlight.
  programs = { light = { enable = true; }; };

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
}
