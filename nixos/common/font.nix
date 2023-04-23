{ pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
      vazir-fonts
      lexend
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Vazir" "Lexend" ];
        sansSerif = [ "Vazir" "Lexend" ];
        monospace = [ "Code New Roman Nerd Font" ];
      };
    };
  };
}
