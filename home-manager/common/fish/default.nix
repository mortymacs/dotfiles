{ pkgs, ... }:
let
  defaultAliases = import ../../common/fish/aliases.nix;
  defaultFunctions = import ../../common/fish/functions.nix;
in {
  programs.fish = {
    enable = true;
    plugins = with pkgs; [
      {
        name = "fzf-fish";
        src = fishPlugins.fzf-fish.src;
      }
      {
        name = "forgit";
        src = fishPlugins.forgit.src;
      }
    ];
    shellInit = builtins.readFile ./init.fish;
    shellAbbrs = {
      k = "kubectl";
      rm = "trash";
      ":q" = "exit";
    };
    functions = defaultFunctions;
    shellAliases = defaultAliases;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
