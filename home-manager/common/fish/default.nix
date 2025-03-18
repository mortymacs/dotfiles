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
        rm = "trash";
        ":q" = "exit";
        cb = "wl-copy";
      };
      functions = defaultFunctions;
      shellAliases = defaultAliases;
    };

    fzf = {
      enable = true;
      tmux = {
        enableShellIntegration = true;
      };
      package = pkgs.unstable.fzf;
    };
    skim = {
      enable = true;
    };

    atuin = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        style = "compact";
        show_preview = true;
        keymap_mode = "vim-normal";
      };
      flags = [
        "--disable-up-arrow"
      ];
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  home.packages = with pkgs; [ nix-your-shell ];
}
