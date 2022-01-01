#!/bin/bash

# zsh
rm -rf zsh/*
cp "$HOME"/{.zshrc,.zsh_aliases,.p10k.zsh} zsh/

# tmux
rm -rf tmux/*
cp "$HOME"/.tmux.conf tmux/

# alacritty
rm -rf alacritty/*
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

# lf
rm -rf lf
cp -R "$HOME"/.config/lf/ .

# i3
rm -rf i3 i3status
cp -R "$HOME"/.config/i3/ .
cp -R "$HOME"/.config/i3status/ .

# fonts
rm -rf fonts/*
cp -R "$HOME"/.local/share/fonts/{Code\ New\ Roman\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Bold\ Nerd\ Font\ Complete\ Mono.otf,Code\ New\ Roman\ Italic\ Nerd\ Font\ Complete\ Mono.otf} fonts/

# push changes.
git status -s
git add .
git commit -m "Update dotfiles"
git push -q
