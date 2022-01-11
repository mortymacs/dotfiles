# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export QT_QPA_PLATFORMTHEME=qt5ct

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/gitstatus/gitstatus.prompt.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh_aliases
#source $HOME/.local/bin/forgit.plugin.zsh
export PATH=$PATH:/home/mort/.gem/ruby/2.7.0/bin/:/home/mort/.local/bin

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_SPACE

# https://unix.stackexchange.com/a/258661/204066
autoload -U select-word-style
select-word-style bash

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# https://unix.stackexchange.com/a/57841/204066
bindkey -e ${$(tput kDC3 2>/dev/null):-'\e[3;3~'} kill-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ';5D' backward-word
bindkey ';3D' backward-word
bindkey ';5C' forward-word
bindkey ';3C' forward-word

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload ztodo
source /home/mort/.config/broot/launcher/bash/br

export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.local/share/go/pkg/mod"

# https://stackoverflow.com/a/22481496
export TERM="xterm-256color"

# https://unix.stackexchange.com/a/177979
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=alacritty

# bat
export BAT_THEME="Coldark-Dark"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# auto completion
# https://unix.stackexchange.com/questions/185537/combining-zsh-s-tab-completion-with-case-insensitivity
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt MENU_COMPLETE
setopt no_list_ambiguous

export MCFLY_FUZZY=true
eval "$(mcfly init zsh)"

# https://github.com/romkatv/powerlevel10k/issues/1474#issuecomment-875062137
export ZLE_RPROMPT_INDENT=0

# lf
source ~/.config/lf/icon
