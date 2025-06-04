{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      unstable.nerd-fonts.jetbrains-mono
      unstable.vazir-fonts
      unstable.noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Adwaita Sans"
          "Vazirmatn"
        ];
        sansSerif = [
          "Adwaita Sans"
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
