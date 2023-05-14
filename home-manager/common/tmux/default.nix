{ pkgs, ... }:
let
    left_icon = "";
    right_icon = "";
in
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

        # Colors (my colors + spaceduck colors).
        # This tmux statusbar config was created by tmuxline.vim
        # https://github.com/edkolev/tmuxline.vim
        set -g status-justify "left"
        set -g status "on"
        set -g status-left-style "none"
        set -g message-command-style "fg=#0d1321,bg=#3e5c76"
        set -g status-right-style "none"
        set -g status-style "none,bg=#0d1321"
        set -g pane-active-border-style "fg=#5ccc96"
        set -g message-style "fg=#0f111b,bg=#b3a1e6"
        set -g pane-border-style "fg=#3e5c76"
        set -g status-right-length "100"
        set -g status-left-length "100"
        setw -g window-status-activity-style "none"
        setw -g window-status-separator ""
        setw -g window-status-style "none,fg=#3e5c76,bg=#30365F"
        set -g status-left "#[fg=#f0ebd8,bg=#1d2d44] #S #[fg=#1d2d44,bg=#0d1321,nobold,nounderscore,noitalics]${left_icon}"
        set -g status-right "#[fg=#0d1321,bg=#0d1321,nobold,nounderscore,noitalics]${right_icon}#[fg=#3e5c76,bg=#0d1321] #h #{tmux_mode_indicator} "
        setw -g window-status-format "#[fg=#3e5c76,bg=#0d1321] #I #[fg=#3e5c76,bg=#0d1321] #W "
        setw -g window-status-current-format "#[fg=#0d1321,bg=#3e5c76,nobold,nounderscore,noitalics]${left_icon}#[fg=#0d1321,bg=#3e5c76] #I #[fg=#0d1321,bg=#3e5c76] #W #[fg=#3e5c76,bg=#0d1321,nobold,nounderscore,noitalics]${left_icon}"
        '';
        plugins = with pkgs; [
            tmuxPlugins.fuzzback
            tmuxPlugins.tmux-fzf
        ];

        tmuxp = {
            enable = true;
        };
    };
}
