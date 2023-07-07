{ pkgs, ... }:
let
  background = "#0d1b2a";
  foreground = "#faf3dd";
  left_background = "#b33f62";
  left_foreground = "#faf3dd";
  active_pane_background = "#f9564f";
  #left_icon = "";
  #right_icon = "";
  left_icon = "";
  right_icon = "";
in {
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
      set -g message-command-style "fg=${background},bg=${active_pane_background}"
      set -g status-right-style "none"
      set -g status-style "none,bg=${background}"
      set -g pane-active-border-style "fg=${background}"
      set -g message-style "fg=${foreground},bg=${background}"
      set -g pane-border-style "fg=${background}"
      set -g status-right-length "100"
      set -g status-left-length "100"
      setw -g window-status-activity-style "none"
      setw -g window-status-separator ""
      setw -g window-status-style "none,fg=${active_pane_background},bg=${background}"
      set -g status-left "#[fg=${left_foreground},bg=${left_background}] #S #[fg=${left_background},bg=${background},nobold,nounderscore,noitalics]${left_icon}"
      set -g status-right "#[fg=${background},bg=${background},nobold,nounderscore,noitalics]${right_icon}#[fg=${active_pane_background},bg=${background}] #h #{tmux_mode_indicator} "
      setw -g window-status-format "#[fg=${active_pane_background},bg=${background}] #I #[fg=${active_pane_background},bg=${background}] #W "
      setw -g window-status-current-format "#[fg=${background},bg=${active_pane_background},nobold,nounderscore,noitalics]${left_icon}#[fg=${background},bg=${active_pane_background}] #I #[fg=${background},bg=${active_pane_background}] #W #[fg=${active_pane_background},bg=${background},nobold,nounderscore,noitalics]${left_icon}"
    '';
    plugins = with pkgs; [ tmuxPlugins.fuzzback tmuxPlugins.tmux-fzf ];

    tmuxp = { enable = true; };
  };
}
