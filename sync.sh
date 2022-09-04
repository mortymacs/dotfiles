#!/bin/bash

# zsh
rm -rf zsh/*
cp "$HOME"/{.zshrc,.zsh_aliases,.zshenv} zsh/

# starship
rm -rf starship/*
cp "$HOME"/.config/starship.toml starship/

# tmux
rm -rf tmux/*
cp "$HOME"/.tmux.conf tmux/

# alacritty
rm -rf alacritty
cp -R "$HOME"/.config/alacritty/ .

# btop
rm -rf btop
cp -R "$HOME"/.config/btop/ .

# nvim
rm -rf nvim/*
cp "$HOME"/.config/nvim/{init.vim,coc-settings.json} nvim/

# coc
rm -rf coc/*
cp "$HOME"/.config/coc/extensions/package.json coc/

# gdb, pdb
rm -rf gdb/*
cp "$HOME"/.gdbinit gdb/

# git
rm -rf git/*
cp "$HOME"/{.gitconfig,.gitignore} git/

# delta
rm -rf delta/*
cp "$HOME"/.config/delta/themes.gitconfig delta/

# tig
rm -rf tig/*
cp "$HOME"/.tigrc tig/

# broot
rm -rf broot/*
cp "$HOME"/.config/broot/conf.toml broot/

# most
rm -rf most/*
cp "$HOME"/.mostrc most/

# rofi
rm -rf rofi
cp -R "$HOME"/.config/rofi/ .

# i3
rm -rf i3
cp -R "$HOME"/.config/i3/ .

# i3status-rs
rm -rf i3status-rust
cp -R "$HOME"/.config/i3status-rust .

# dunst
rm -rf dunst
cp -R "$HOME/.config/dunst" .

# flameshot
rm -rf flameshot/*
cp "$HOME"/.config/flameshot/flameshot.ini flameshot/

# yay
rm -rf yay/*
cp "$HOME"/.config/yay/config.json yay/

# packages
rm -rf pacman/*
pacman -Qqen > pacman/packages.txt
pacman -Qqem > pacman/thirdparty.txt

# docker
rm -rf docker/*
cat "$HOME"/.docker/config.json | jq 'del(.auths)' | tee docker/config.json

# zeal
rm -rf zeal/*
cp "$HOME/.config/Zeal/Zeal.conf" zeal/

# fonts
rm -rf fonts/*
cp -R "$HOME"/.local/share/fonts/{Code\ New\ Roman\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Bold\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Italic\ Nerd\ Font\ Complete\ Mono.otf,'AnekLatin-VariableFont_wdth,wght.ttf'} fonts/

# push changes.
git status -s
git add .
git commit -m "Update dotfiles"
git push -q
