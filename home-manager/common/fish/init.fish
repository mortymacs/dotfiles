# Fish.
set -U fish_greeting

# Tmux.
set -x TMUX_PLUGIN_MANAGER_PATH "$HOME"/.config/tmux/plugins/

# GTK.
set -x GTK_THEME Yaru-purple-dark

# Qt.
set -x QT_QPA_PLATFORM xcb
set -x QT_QPA_PLATFORMTHEME qt5ct

# GUI
# https://github.com/alacritty/alacritty/issues/3299#issuecomment-582789847
set -x WINIT_UNIX_BACKEND x11
set -x WINIT_X11_SCALE_FACTOR 1
set -x XDG_SESSION_TYPE x11

# Python.
# https://github.com/python-poetry/poetry/issues/5250#issuecomment-1067193647
set -x PYTHON_KEYRING_BACKEND keyring.backends.fail.Keyring

# Go.
set -x GOPATH "$HOME/.local/share/go"
set -x GOMODCACHE "$HOME/.local/share/go/pkg/mod"
set -x GOPRIVATE "gitlab.ci.fdmg.org/*"
set -x GOCOVSH_THEME mocha

# Python.
# https://www.andreagrandi.it/2018/10/16/using-ipdb-with-python-37-breakpoint/
set -x PYTHONBREAKPOINT ipdb.set_trace

# https://stackoverflow.com/a/22481496
set -x TERM "xterm-256color"

# Editors.
set -x VISUAL nvim
set -x EDITOR nvim
set -x TERMINAL alacritty

# Bat
set -x BAT_THEME 'Coldark-Dark'

# Fzf.
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--no-separator --inline-info --cycle --tabstop=4 --bind alt-up:preview-half-page-up,alt-down:preview-half-page-down --height ~70% --layout=reverse --preview-window=noborder --color "hl+:#EB5E55,gutter:#0f0f0f,pointer:#D81E5B"'

# Ghq.
set -x GHQ_ROOT "$HOME/Workspaces"

# Most.
set -x MOST_INITFILE "$HOME"/.config/most/mostrc

# Man
set -x MANPAGER most

# General.
set -x PATH "$PATH:$HOME/.local/bin:$GOPATH/bin"
