#!/bin/sh

wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip
mv *.ttf ~/.local/share/fonts
fc-cache -f -r -v
