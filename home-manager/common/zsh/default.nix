let
    defaultAliases = import ./aliases.nix;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    history.ignoreSpace = true;
    envExtra = builtins.readFile ./zshenv;
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
    shellAliases = defaultAliases;
    history = {
      extended = true;
      ignorePatterns = [
        "rm *"
        "shutdown *"
        "reboot *"
        "sudo shutdown *"
        "sudo reboot *"
      ];
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
