{ pkgs }:
{
  fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    vazir-fonts
    lexend
  ];
  fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "lexend" "Vazir" ];
      sansSerif = [ "lexend" "Vazir" ];
      monospace = [ "Ellograph CF Neovim Test 2" "Code New Roman Nerd Font" ];
    };
  };
}
