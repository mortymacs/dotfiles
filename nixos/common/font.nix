{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      unstable.nerd-fonts.code-new-roman
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
          "CodeNewRoman Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
