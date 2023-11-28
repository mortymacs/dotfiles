{ pkgs, ... }: {
  home.packages = with pkgs; [
    (tabbed.overrideAttrs (oldAttrs: rec {
      configFile = writeText "config.def.h" (builtins.readFile ./config.def.h);
      postPatch = ''
        ${oldAttrs.postPatch}
         cp ${configFile} config.def.h'';
    }))
    (writeShellScriptBin "tabc" (builtins.readFile ./tabc.sh))
  ];
}
