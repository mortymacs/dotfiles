#!/bin/bash

# xresources
diff "$HOME/.Xresources" xresources/

# zsh
diff "$HOME/.zshrc" zsh/.zshrc
diff "$HOME/.zsh_aliases" zsh/.zsh_aliases
diff "$HOME/.zshenv" zsh/.zshenv

# starship
diff "$HOME/.config/starship.toml" starship/

# tmux
diff "$HOME/.tmux.conf" tmux/

# alacritty
diff "$HOME/.config/alacritty/" alacritty/

# btop
diff "$HOME/.config/btop/" btop/

# nvim
diff "$HOME/.config/nvim/init.vim" nvim/init.vim
diff "$HOME/.config/nvim/coc-settings.json" nvim/coc-settings.json

# coc
diff "$HOME/.config/coc/extensions/package.json" coc/package.json

# gdb, pdb
diff "$HOME/.gdbinit" gdb/

# git
diff "$HOME/.gitconfig" git/.gitconfig
diff "$HOME/.gitignore" git/.gitignore

# delta
diff "$HOME/.config/delta/themes.gitconfig" delta/

# tig
diff "$HOME/.tigrc" tig/

# broot
diff "$HOME/.config/broot/conf.toml" broot/

# most
diff "$HOME/.mostrc" most/

# rofi
diff "$HOME/.config/rofi/" rofi/

# bspwm
diff "$HOME/.config/bspwm/" bspwm/

# sxhkd
diff "$HOME/.config/sxhkd/" sxhkd/

# polybar
diff "$HOME/.config/polybar/" polybar/

# dunst
diff "$HOME/.config/dunst/" dunst/

# flameshot
diff "$HOME"/.config/flameshot/flameshot.ini flameshot/

# yay
diff "$HOME"/.config/yay/config.json yay/

# packages
pacman -Qqen > /tmp/pacman-packages.txt
pacman -Qqem > /tmp/pacman-thirdparty.txt
diff /tmp/pacman-packages.txt pacman/packages.txt
diff /tmp/pacman-thirdparty.txt pacman/thirdparty.txt

# docker
diff "$HOME"/.docker/config.json docker/config.json

# peco
diff "$HOME/.config/peco/" peco/

# zeal
diff "$HOME/.config/Zeal/" zeal/

# fonts
diff "$HOME/.local/share/fonts/" fonts/

# fonts config
diff "$HOME/.config/fontconfig/fonts.conf" fontconfig/

# tmuxp
diff "$HOME/.config/tmuxp" tmuxp/

