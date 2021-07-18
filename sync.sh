#!/bin/sh

# zsh
cp ~/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
cp ~/.tmux.conf tmux/

# Alacritty
cp ~/.alacritty.yml alacritty/

# nvim
cp ~/.config/nvim/{init.vim,coc-settings.json} nvim/

# coc
cp ~/.config/coc/extensions/package.json coc/

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

# docker
cp ~/.docker/config.json docker/

# upddate gnome settings.
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/alacritty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ""

# push changes.
git status
git add .
git commit -m "Update dotfiles"
git push
