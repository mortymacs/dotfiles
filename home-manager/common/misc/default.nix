{
  # Services.
  services = {
    udiskie = {
      enable = true;
      tray = "auto";
      settings = {
        program_options = {
          udisks_version = 2;
          tray = true;
        };
        icon_names.media = [ "media-optical" ];
      };
    };
  };

  # Custom config.
  xdg.configFile = {
    "most/mostrc".source = ./mostrc;
  };
}
