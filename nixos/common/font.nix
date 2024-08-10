{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      unstable.vazir-fonts
      unstable.lexend
      unstable.noto-fonts-emoji
      unstable.jetbrains-mono
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
          "JetBrains Mono"
          "Symbols Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
