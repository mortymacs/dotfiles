{ pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      vazir-fonts
      lexend
      joypixels
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Vazirmatn" "Lexend" ];
        sansSerif = [ "Vazirmatn" "Lexend" ];
        monospace = [ "Ellograph CF" "Symbols-2048-em Nerd Font" ];
        emoji = [ "JoyPixels" ];
      };
    };
  };
  nixpkgs.config.joypixels.acceptLicense = true;
}
