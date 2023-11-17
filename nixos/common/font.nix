{ pkgs, ... }: {
  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      unstable.vazir-fonts
      unstable.lexend
      unstable.noto-fonts-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Lexend" "Vazirmatn" ];
        sansSerif = [ "Lexend" "Vazirmatn" ];
        monospace = [ "Ellograph CF" "Noto Color Emoji" "Symbols-2048-em Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
