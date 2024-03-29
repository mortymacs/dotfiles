{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Lexend 10";
        markup = "full";
        frame_width = 1;
        frame_color = "#7a5ccc";
        corner_radius = 0;
        gap_size = 1;
        offset = "2x30";
        icon_theme = "Arc";
      };
      urgency_low = {
        background = "#0f111b";
        foreground = "#b3a1e6";
        timeout = 10;
      };
      urgency_normal = {
        background = "#0f111b";
        foreground = "#ecf0c1";
        timeout = 10;
      };
      urgency_critical = {
        background = "#0f111b";
        foreground = "#ce6f8f";
        frame_color = "#B93C89";
        timeout = 0;
      };
    };
  };
}
