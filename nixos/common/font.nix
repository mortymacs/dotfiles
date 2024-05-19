{ pkgs, ... }:
let mono = "CodeNewRoman";
in {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      (unstable.nerdfonts.override { fonts = [ mono ]; })
      unstable.vazir-fonts
      unstable.lexend
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Lexend" "Vazirmatn" ];
        sansSerif = [ "Lexend" "Vazirmatn" ];
        monospace = [ "${mono} Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
