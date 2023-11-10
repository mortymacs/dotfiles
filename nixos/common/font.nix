{ pkgs, ... }: {
  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
      unstable.vazir-fonts
      unstable.lexend
      unstable.noto-fonts-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Lexend" "Vazirmatn" ];
        sansSerif = [ "Lexend" "Vazirmatn" ];
        monospace =
          [ "CodeNewRoman Nerd Font" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
