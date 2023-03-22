#!/bin/bash

# xresources
rm -rf xresources/*
cp "$HOME/.Xresources" xresources/

# gtk
rm -rf gtk3/
cp -R "$HOME/.config/gtk-3.0/" gtk3

# icon
rm -rf icons/
cp -R "$HOME/.icons/" icons

# zsh
rm -rf zsh/*
cp "$HOME"/{.zshrc,.zsh_aliases,.zshenv} zsh/

# alacritty
rm -rf alacritty/
cp -R "$HOME"/.config/alacritty .

# wezterm
rm -rf wezterm/
cp -R "$HOME"/.config/wezterm .

# starship
rm -rf starship/*
cp "$HOME"/.config/starship.toml starship/

# tmux
rm -rf tmux/*
cp "$HOME"/.config/tmux/tmux.conf tmux/

# btop
rm -rf btop
cp -R "$HOME"/.config/btop/ .

# nvim
rm -rf nvim/*
cp -R "$HOME"/.config/nvim/{init.lua,lua} nvim/

# gdb, pdb
rm -rf gdb/*
cp "$HOME"/.gdbinit gdb/

# git
rm -rf git
cp -R "$HOME"/.config/git/ .

# tig
rm -rf tig/*
cp "$HOME"/.tigrc tig/

# broot
rm -rf broot/*
cp "$HOME"/.config/broot/conf.toml broot/

# most
rm -rf most/*
cp "$HOME"/.mostrc most/

# procs
rm -rf procs
cp -R "$HOME/.config/procs/" .

# rofi
rm -rf rofi
cp -R "$HOME"/.config/rofi/ .

# bspwm
rm -rf bspwm
cp -R "$HOME"/.config/bspwm/ .

# sxhkd
rm -rf sxhkd
cp -R "$HOME"/.config/sxhkd/ .

# polybar
rm -rf polybar
cp -R "$HOME"/.config/polybar .

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
rm -rf packages/*
pacman -Qqen > packages/packages.txt
pacman -Qqem > packages/thirdparty.txt

# docker
rm -rf docker/*
cat "$HOME"/.docker/config.json | jq 'del(.auths)' | tee docker/config.json

# peco
rm -rf peco
cp -R "$HOME/.config/peco" .

# fonts
rm -rf fonts/*
cp "$HOME/.local/share/fonts/Lexend-VariableFont_wght.ttf" fonts/
cp "$HOME/.local/share/fonts/Lexend-license.txt" fonts/
cp "$HOME/.local/share/fonts/AnekLatin.ttf" fonts/
cp "$HOME/.local/share/fonts/AnekLatin-license.txt" fonts/

# fontconfig
rm -rf fontconfig/*
cp "$HOME/.config/fontconfig/fonts.conf" fontconfig/

# tmuxp
rm -rf tmuxp
cp -R "$HOME/.config/tmuxp" .

# bin
rm -f bin/*
cp "$HOME/.local/bin/monitor-internal" bin/
cp "$HOME/.local/bin/monitor-external" bin/

# push changes.
git status -s
git add .
git commit -m "Update dotfiles"
git push -q
