{ pkgs, ... }: {
  #home.packages = with pkgs;
  #   [
  #     (st.overrideAttrs (oldAttrs: rec {
  #       configFile =
  #         writeText "config.def.h" (builtins.readFile ./config.def.h);
  #       patches = [
  #         ./st-vertcenter-20231003-eb3b894.diff
  #         ./st-charoffsets-20220311-0.8.5.diff
  #         ./st-dynamic-cursor-color-0.9.diff
  #       ];
  #       postPatch = ''
  #         ${oldAttrs.postPatch}
  #          cp ${configFile} config.def.h'';
  #     }))
  #   ];

  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };

  xdg.configFile = {
     "alacritty/alacritty.toml".source = ./alacritty.toml;
  };
}
