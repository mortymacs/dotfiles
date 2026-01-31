{ pkgs, ... }:
let
  defaultAliases = import ../../common/fish/aliases.nix;
  defaultFunctions = import ../../common/fish/functions.nix;
in
{
  programs = {
    fish = {
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
        ":q" = "exit";
        gs = "git status --short";
        gd = "git diff";
        gl = "git log --oneline --decorate --graph --show-signature";
        gb = "git blame `f`";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gf = "git fetch --prune --all";
        gpr = "git pull --rebase";
      };
      functions = defaultFunctions;
      shellAliases = defaultAliases;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      tmux = {
        enableShellIntegration = true;
      };
      package = pkgs.unstable.fzf;
    };
    skim = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  home.packages = with pkgs; [ nix-your-shell ];
}
