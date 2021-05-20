#!/bin/sh

# zsh
cp ~/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
cp ~/.tmux.conf tmux/

# Alacritty
cp ~/.alacritty.yml alacritty/

# emacs
#cp ~/.emacs ./emacs/
#cp /home/morteza/.emacs.d/{functions.el,keybindings.el,theme.el} emacs/.emacs.d/

# vim
cp ~/.vimrc ./vim/

# cocvim
cp ~/.vim/coc-settings.json ./vim/

# gdb, pdb
cp ~/.gdbinit gdb/
cp ~/.pdbrc pdb/

# git
cp ~/{.gitconfig,.gitignore} git/

# tig
cp ~/.tigrc tig/

# broot
cp ~/.config/broot/conf.toml broot/

# packages
pacman -Qqen > pacman/packages.txt
pacman -Qqem > pacman/thirdparty.txt

# dconf
#dconf dump /org/gnome/terminal/legacy/profiles:/ > dconf/gnome-terminal.dump
#cp ~/.config/alacritty/alacritty.yml alacritty/

# docker
cp ~/.docker/config.json docker/

# push changes.
git status
git add .
git commit -m "Update dotfiles"
git push
