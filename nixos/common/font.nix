{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      unstable.nerd-fonts.code-new-roman
      unstable.fira-sans
      unstable.vazir-fonts
      unstable.noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Fira Sans"
          "Vazirmatn"
        ];
        sansSerif = [
          "Fira Sans"
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
