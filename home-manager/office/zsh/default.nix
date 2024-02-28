{ pkgs, ... }:
let defaultAliases = import ../../common/zsh/aliases.nix;
in {
  programs.zsh = {
    enable = true;
    autocd = true;

    # Auto suggestion.
    enableAutosuggestions = true;

    # Syntax highlighting.
    syntaxHighlighting.enable = true;

    # Auto completion.
    enableCompletion = true;

    # History.
    history = {
      extended = true;
      share = true;
      ignoreSpace = true;
      ignorePatterns =
        [ "rm *" "shutdown *" "reboot *" "sudo shutdown *" "sudo reboot *" ];
    };
    historySubstringSearch = { enable = true; };

    plugins = with pkgs; [
      {
        name = "fzf-tab";
        src = zsh-fzf-tab.src;
      }
      {
        name = "nix-shell";
        src = zsh-nix-shell.src;
      }
    ];

    # Env variables.
    envExtra = builtins.readFile ./zshenv;

    # Aliases.
    shellAliases = defaultAliases;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
