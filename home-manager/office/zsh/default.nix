{ pkgs, ... }:
let defaultAliases = import ../../common/zsh/aliases.nix;
in {
  programs.zsh = {
    enable = true;
    autocd = true;

    # Auto suggestion.
    enableAutosuggestions = true;

    # Syntax highlighting.
    enableSyntaxHighlighting = true;

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
    ];

    # Env variables.
    envExtra = builtins.readFile ./zshenv;

    # Initialize.
    initExtra = ''
      # Text.
      # https://unix.stackexchange.com/a/258661/204066
      autoload -U select-word-style
      select-word-style bash
      # https://unix.stackexchange.com/a/57841/204066
      bindkey -e $\{$(tput kDC3 2>/dev/null):-'\e[3;3~'\} kill-word
      bindkey ';5D' backward-word
      bindkey ';3D' backward-word
      bindkey ';5C' forward-word
      bindkey ';3C' forward-word
      bindkey '^[[P' delete-char
    '';

    # Aliases.
    shellAliases = defaultAliases;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
