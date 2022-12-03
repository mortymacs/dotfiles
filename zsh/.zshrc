# Env.
source $HOME/.zshenv
[ -e "$HOME/.zshenv_private" ] && source $HOME/.zshenv_private

# History.
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Auto completion.
autoload -Uz compinit
# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# https://unix.stackexchange.com/questions/185537/combining-zsh-s-tab-completion-with-case-insensitivity
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion::complete:*' gain-privileges 1
setopt MENU_COMPLETE
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_SPACE
setopt no_list_ambiguous

# Plugins.
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
