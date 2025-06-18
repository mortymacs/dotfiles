# Fish.
set -U fish_greeting
fish_vi_key_bindings

# Shell wrapper.
if command -q nix-your-shell
  nix-your-shell fish | source
end

# Wayland.
set -x XDG_SESSION_TYPE wayland

# Tmux.
set -x TMUX_PLUGIN_MANAGER_PATH "$HOME"/.config/tmux/plugins/

# Rust.
set -x CARGO_HOME "$HOME/.local/share/cargo"

# Go.
set -x GOPATH "$HOME/.local/share/go"
set -x GOMODCACHE "$HOME/.local/share/go/pkg/mod"
set -x GOPRIVATE "gitlab.ci.fdmg.org/*"
set -x GOCOVSH_THEME mocha

# Python.
# https://www.andreagrandi.it/2018/10/16/using-ipdb-with-python-37-breakpoint/
set -x PYTHONBREAKPOINT ipdb.set_trace
set -x IPYTHONDIR "$HOME/.config/ipython"

# Database.
set -x MYCLI_HISTFILE "$HOME/.config/mycli/history"

# https://stackoverflow.com/a/22481496
set -x TERM "xterm-256color"

# Editors.
set -x VISUAL nvim
set -x EDITOR nvim
set -x TERMINAL kitty

# Bat
set -x BAT_THEME 'ayu-dark'

# Fzf.
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--no-separator --inline-info --cycle --no-scrollbar --tabstop=4 --bind alt-k:up,alt-j:down,ctrl-k:preview-up,ctrl-j:preview-down --layout=reverse --preview-window=noborder --color "hl+:#EB5E55,gutter:#0f0f0f,pointer:#D81E5B"'

# Ghq.
set -x GHQ_ROOT "$HOME/Workspaces"

# Most.
set -x MOST_INITFILE "$HOME"/.config/most/mostrc

# AI.
set -x OPENAI_API_KEY (cat ~/.config/openai/secret)
set -x SRC_ENDPOINT (cat ~/.config/cody/server)
set -x SRC_ACCESS_TOKEN (cat ~/.config/cody/secret)

# Man
set -x MANPAGER most

# AWS.
set -x AWS_CONFIG_FILE "$HOME/.config/aws/config"
set -x AWS_DATA_PATH "$HOME/.config/aws/models"
set -x AWS_SHARED_CREDENTIALS_FILE "$HOME/.config/aws/credentials"

# General.
set -x PATH "$PATH:$HOME/.local/bin:$GOPATH/bin:$CARGO_HOME/bin"
