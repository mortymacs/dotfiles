{
  # Services.
  services = {
    udiskie = {
      enable = true;
    };
  };

  # Custom config.
  xdg.configFile = {
    "most/mostrc".source = ./mostrc;
  };
}
