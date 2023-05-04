{ pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
      vazir-fonts
      lexend
      joypixels
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Vazirmatn" "Lexend" ];
        sansSerif = [ "Vazirmatn" "Lexend" ];
        monospace = [ "Ellograph CF" "JoyPixels" "Code New Roman Nerd Font" ];
        emoji = [ "JoyPixels" ];
      };
    };
  };
  nixpkgs.config.joypixels.acceptLicense = true;
}
