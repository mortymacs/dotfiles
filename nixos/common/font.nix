{ pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      vazir-fonts
      lexend
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Vazir" "Lexend" ];
        sansSerif = [ "Vazir" "Lexend" ];
        monospace = [ "Ellograph CF" ];
      };
    };
  };
}
