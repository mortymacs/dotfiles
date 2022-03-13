# General.
# https://github.com/romkatv/powerlevel10k/issues/1474#issuecomment-875062137
export ZLE_RPROMPT_INDENT=0
export PATH=$PATH:/home/mort/.gem/ruby/2.7.0/bin/:/home/mort/.local/bin

# History.
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Auto completion.
autoload -Uz compinit
compinit
# https://unix.stackexchange.com/questions/185537/combining-zsh-s-tab-completion-with-case-insensitivity
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion::complete:*' gain-privileges 1
setopt MENU_COMPLETE
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_SPACE
setopt no_list_ambiguous

# Zsh plugins.
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/gitstatus/gitstatus.prompt.zsh
source $HOME/.zsh_aliases

# Text.
# https://unix.stackexchange.com/a/258661/204066
autoload -U select-word-style
select-word-style bash
# https://unix.stackexchange.com/a/57841/204066
bindkey -e ${$(tput kDC3 2>/dev/null):-'\e[3;3~'} kill-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ';5D' backward-word
bindkey ';3D' backward-word
bindkey ';5C' forward-word
bindkey ';3C' forward-word

# Qt.
export QT_QPA_PLATFORMTHEME=qt5ct

# Z.
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Broot.
source /home/mort/.config/broot/launcher/bash/br

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
export BAT_THEME="Coldark-Dark"

# Fzf.
export FZF_DEFAULT_COMMAND='fd --type f'

# Mcfly.
export MCFLY_FUZZY=true
eval "$(mcfly init zsh)"

# Ghq.
export GHQ_ROOT="$HOME/Workspaces"

# Starship.
eval "$(starship init zsh)"
