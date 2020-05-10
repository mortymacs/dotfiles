#!/bin/sh

# zsh
cp ~/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
cp ~/.tmux.conf tmux/

# emacs
cp ~/.emacs ./emacs/
cp /home/morteza/.emacs.d/{functions.el,keybindings.el,theme.el} emacs/.emacs.d/

# gdb
cp ~/.gdbinit gdb/

# git
cp ~/{.gitconfig,.gitignore} git/

# tig
cp ~/.tigrc tig/

# packages
pacman -Qqen > pacman/packages.txt
pacman -Qqem > pacman/thirdparty.txt
