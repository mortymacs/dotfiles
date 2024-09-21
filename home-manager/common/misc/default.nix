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
    # Bat.
    "bat/themes/ayu-dark.tmTheme".source = ./ayu-dark.tmTheme;
    # Clangd.
    "clangd/config.yaml".source = ./clangd.yaml;
  };
}
