{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
