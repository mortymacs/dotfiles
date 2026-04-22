# XDG.
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

# Fish.
set -U fish_greeting
fish_vi_key_bindings
set -g fish_no_beep 1

# Shell wrapper.
if command -q nix-your-shell
  nix-your-shell fish | source
end

# Tmux.
set -x TMUX_PLUGIN_MANAGER_PATH "$XDG_CONFIG_HOME/tmux/plugins/"

# Editors.
set -x VISUAL nvim
set -x EDITOR nvim
set -x TERMINAL ghostty

# Bat
set -x BAT_THEME 'Coldark-Dark'

# Fzf.
set -x FZF_DEFAULT_COMMAND "fd"
set -x FZF_DEFAULT_OPTS "\
  --no-mouse \
  --style=full \
  --border=none \
  --ansi \
  --pointer='' \
  --no-scrollbar \
  --no-separator \
  --prompt=' ' \
  --color 'border:#355070,label:#eaac8b' \
  --color 'preview-border:#5e548e,preview-label:#eaac8b' \
  --color 'list-border:#6d597a,list-label:#eaac8b' \
  --color 'input-border:#3d5a80,input-label:#eaac8b' \
  --color 'header-border:#606c38,input-label:#eaac8b' \
  --bind alt-k:up,alt-j:down,ctrl-k:preview-up,ctrl-j:preview-down \
  --layout=reverse
"
set -x FZF_CTRL_T_COMMAND "fd --type f"
set -x FZF_CTRL_T_OPTS "--preview 'test -f {} && bat -n --color=always {}'"

# Ghq.
set -x GHQ_ROOT "$HOME/Workspaces"

# Most.
set -x MOST_INITFILE "$XDG_CONFIG_HOME/most/mostrc"

# Man
set -x MANPAGER most

# Rust.
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"

# Go.
set -x GOPATH "$XDG_DATA_HOME/go"
set -x GOMODCACHE "$XDG_DATA_HOME/go/pkg/mod"
set -x GOCOVSH_THEME mocha

# Python.
set -x IPYTHONDIR "$XDG_CONFIG_HOME/ipython"

# Node.
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

# Kubernetes.
set -x KUBECONFIG "$XDG_CONFIG_HOME/kube/config"

# Terraform.
set -x TF_DATA_DIR "$XDG_DATA_HOME/terraform"

# AWS.
set -x AWS_CONFIG_FILE "$XDG_CONFIG_HOME/aws/config"
set -x AWS_DATA_PATH "$XDG_CONFIG_HOME/aws/models"
set -x AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME/aws/credentials"

# AI.
set -x NVIM_CLAUDE_ENABLED true
set -x NVIM_COPILOT_ENABLED false
set -x CLAUDE_CONFIG_DIR "$XDG_CONFIG_HOME/claude"

# General.
set -x PATH "$PATH:$HOME/.local/bin:$GOPATH/bin:$CARGO_HOME/bin"

# Extra.
set extra_init "$XDG_CONFIG_HOME/fish/extra.fish"
if test -f "$extra_init"
    source "$extra_init"
end
