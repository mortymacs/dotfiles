# Zsh.
# https://github.com/romkatv/powerlevel10k/issues/1474#issuecomment-875062137
export ZLE_RPROMPT_INDENT=0

# Qt.
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORMTHEME=qt5ct

# GUI
# https://github.com/alacritty/alacritty/issues/3299#issuecomment-582789847
export WINIT_UNIX_BACKEND=x11
export XDG_SESSION_TYPE=x11
export WINIT_X11_SCALE_FACTOR=2

# Python.
# https://github.com/python-poetry/poetry/issues/5250#issuecomment-1067193647
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring

# Golang.
export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.local/share/go/pkg/mod"

# Python.
# https://www.andreagrandi.it/2018/10/16/using-ipdb-with-python-37-breakpoint/
export PYTHONBREAKPOINT=ipdb.set_trace

# https://stackoverflow.com/a/22481496
export TERM="xterm-256color"

# Editors.
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=alacritty

# Bat
export BAT_THEME='gruvbox-dark'

# Fzf.
export FZF_DEFAULT_COMMAND='fd --type f'

# Ghq.
export GHQ_ROOT="$HOME/Workspaces"

# Mcfly.
export MCFLY_FUZZY=true

# Xsecurelock.
export XSECURELOCK_FONT="CodeNewRoman Nerd Font Mono"
export XSECURELOCK_SHOW_KEYBOARD_LAYOUT=0
export XSECURELOCK_DISCARD_FIRST_KEYPRESS=0
export XSECURELOCK_SHOW_HOSTNAME=0
export XSECURELOCK_SHOW_DATETIME=0

# General.
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$PYENV_ROOT/bin:$PATH"
