#!/bin/sh

exit  # leave root user

# emacs
cp ../emacs/emacs ~/.emacs
emacs -nw --eval="(package-install-selected-packages)"

# tmux
cp ../tmux/tmux.conf ~/.tmux.conf

# set terminal theme (dconf)

# update dock settings (bottom, max size)

# update dock to default icons and orders

# install gnome extensions

# set timezone and language config

# install gnome theme and set as default

# set default hot keys (super + enter -> terminal , ...)

# set default fonts (mono, ...)
