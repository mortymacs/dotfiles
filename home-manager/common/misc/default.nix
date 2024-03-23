{
  # Services.
  services = {
    cliphist = {
      enable = true;
      systemdTarget = "sway-session.target";
    };
  };

  # Custom config.
  xdg.configFile = {
    # Most.
    "most/mostrc".source = ./mostrc;
    # Procs.
    "procs/config.toml".source = ./procs.toml;
  };
}
