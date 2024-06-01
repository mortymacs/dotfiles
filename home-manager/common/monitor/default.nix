{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile = {
          name = "default";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        };
      }
      {
        profile = {
          name = "home";
          outputs = [
            {
              criteria = "DP-1";
              status = "enable";
            }
            {
              criteria = "eDP-1";
              status = "disable";
            }
          ];
        };
      }
      {
        profile = {
          name = "home-dock";
          outputs = [
            {
              criteria = "DP-7";
              status = "enable";
            }
            {
              criteria = "eDP-1";
              status = "disable";
            }
          ];
        };
      }
      {
        profile = {
          name = "office";
          outputs = [
            {
              criteria = "HDMI-A-1";
              status = "enable";
            }
            {
              criteria = "eDP-1";
              status = "disable";
            }
          ];
        };
      }
    ];
  };
}
