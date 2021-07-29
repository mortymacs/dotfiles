#!/bin/bash

# zsh
cp "$HOME"/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
cp "$HOME"/.tmux.conf tmux/

# Alacritty
cp "$HOME"/.alacritty.yml alacritty/

# nvim
cp "$HOME"/.config/nvim/{init.vim,coc-settings.json} nvim/

# coc
cp "$HOME"/.config/coc/extensions/package.json coc/

# gdb, pdb
cp "$HOME"/.gdbinit gdb/
cp "$HOME"/.pdbrc pdb/

# git
cp "$HOME"/{.gitconfig,.gitignore} git/

# tig
cp "$HOME"/.tigrc tig/

# broot
cp "$HOME"/.config/broot/conf.toml broot/

# packages
pacman -Qqen > pacman/packages.txt
pacman -Qqem > pacman/thirdparty.txt

# docker
cat "$HOME"/.docker/config.json | jq 'del(.auths)' | tee docker/config.json

# Gnome shell extensions
cp -R "$HOME"/.local/share/gnome-shell/{extensions,application_state} gnome/extensions

# Fonts
cp -R "$HOME"/.local/share/fonts/{Code\ New\ Roman\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Bold\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Italic\ Nerd\ Font\ Complete\ Mono.otf} gnome/fonts/

# Background
cp "$HOME"/Pictures/wallpaper.jpg gnome/

# upddate gnome settings.
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/alacritty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ""

# push changes.
git status
git add .
git commit -m "Update dotfiles"
git push
