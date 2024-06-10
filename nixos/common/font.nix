{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      unstable.vazir-fonts
      unstable.lexend
      unstable.noto-fonts-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Lexend"
          "Vazirmatn"
        ];
        sansSerif = [
          "Lexend"
          "Vazirmatn"
        ];
        monospace = [
          "Ellograph CF"
          "Symbols Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
