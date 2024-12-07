{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      unstable.nerd-fonts.jetbrains-mono
      unstable.vazir-fonts
      unstable.lexend
      unstable.noto-fonts-color-emoji
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
