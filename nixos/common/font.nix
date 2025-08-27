{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      unstable.nerd-fonts.code-new-roman
      unstable.lexend
      unstable.vazir-fonts
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
          "CodeNewRoman Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
