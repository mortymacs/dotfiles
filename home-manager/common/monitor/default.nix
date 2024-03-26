{
  services.kanshi = {
    enable = true;
    profiles = {
      default = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      };
      home = {
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
      office = {
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
    };
  };
}
