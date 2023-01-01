# Env.
source $HOME/.zshenv
[ -e "$HOME/.zshenv_private" ] && source $HOME/.zshenv_private

# History.
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
HISTORY_IGNORE='(rm *|shutdown *|reboot *|sudo shutdown *|sudo reboot *)'
SAVEHIST=10000
setopt appendhistory

# Auto completion.
autoload -Uz compinit
# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Plugins.
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# Auto completion.
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'

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
bindkey '^[[P' delete-char

# Fix cursor.
# https://unix.stackexchange.com/a/496878
_fix_cursor() {
    echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)

# Zoxide.
eval "$(zoxide init zsh)"

# Broot.
source $HOME/.config/broot/launcher/bash/br

# Mcfly.
eval "$(mcfly init zsh)"

# Starship.
eval "$(starship init zsh)"

# Aliases.
source $HOME/.zsh_aliases
