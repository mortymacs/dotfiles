#!/bin/bash

# zsh
rm -rf zsh/*
cp "$HOME"/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
rm -rf tmux/*
cp "$HOME"/.tmux.conf tmux/

# Alacritty
rm -rm alacritty/*
cp "$HOME"/.alacritty.yml alacritty/

# nvim
rm -rf nvim/*
cp "$HOME"/.config/nvim/{init.vim,coc-settings.json} nvim/

# coc
rm -rf coc/*
cp "$HOME"/.config/coc/extensions/package.json coc/

# gdb, pdb
rm -rf gdb/* pdb/*
cp "$HOME"/.gdbinit gdb/
cp "$HOME"/.pdbrc pdb/

# git
rm -rf git/*
cp "$HOME"/{.gitconfig,.gitignore} git/

# tig
rm -rf tig/*
cp "$HOME"/.tigrc tig/

# broot
rm -rf broot/*
cp "$HOME"/.config/broot/conf.toml broot/

# packages
rm -rf pacman/*
pacman -Qqen > pacman/packages.txt
pacman -Qqem > pacman/thirdparty.txt

# docker
rm -rf docker/*
cat "$HOME"/.docker/config.json | jq 'del(.auths)' | tee docker/config.json

# Gnome shell extensions
rm -rf gnome/*
cp -R "$HOME"/.local/share/gnome-shell/extensions gnome/extensions

# Fonts
cp -R "$HOME"/.local/share/fonts/{Code\ New\ Roman\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Bold\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Italic\ Nerd\ Font\ Complete\ Mono.otf} gnome/fonts/

# Background
cp "$HOME"/Pictures/wallpaper.jpg gnome/

# upddate gnome settings.
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/alacritty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ""

# push changes.
git status -s
git add .
git commit -m "Update dotfiles"
git push -q
