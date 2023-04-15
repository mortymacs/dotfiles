{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        terminal = "screen-256color";
        historyLimit = 20000;
        extraConfig = ''
        # General.
        set -g focus-events     on
        set -g renumber-windows on
        set-option -g status-interval 60
        # https://unix.stackexchange.com/a/552736/204066
        set -ga terminal-overrides ",*256col*:Tc"

        # Keybinding.
        bind -n M-S-Left   previous-window
        bind -n M-S-Right  next-window
        bind -n C-\\       split-window  -h
        bind -n M-\\       split-window  -v
        bind -n M-C-Up     select-pane   -U
        bind -n M-C-Down   select-pane   -D
        bind -n M-C-Left   select-pane   -L
        bind -n M-C-Right  select-pane   -R
        bind -n C-PageUp   switch-client -p
        bind -n C-PageDown switch-client -n
        '';
        plugins = with pkgs; [
            tmuxPlugins.fuzzback
            tmuxPlugins.onedark-theme
            tmuxPlugins.tmux-fzf
        ];

        tmuxp = {
            enable = true;
        };
    };
}
