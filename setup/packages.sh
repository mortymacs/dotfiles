#!/bin/sh

echo 'Installing packages...'

# update
apt update
apt upgrade -y

# -- dev
apt install -y tmux vim emacs-nox
apt install -y gcc g++ python3 python3-venv python3-pip
apt install -y git gitg curl jq
apt install -y libgtk-3-dev

# -- doc
apt install -y graphviz devhelp cppreference-doc-en-html gtk-doc-tools
wget -qO - https://typora.io/linux/public-key.asc | apt-key add -
add-apt-repository 'deb https://typora.io/linux ./'
apt update
apt install -y typora
apt install -y linux-libc-dev util-linux

# -- general
apt install -y wget
apt install -y chromium-browser gnome-calendar

# -- virtualization
apt install -y virtualbox
apt-get remove docker docker-engine docker.io containerd runc
apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io

# -- misc
apt install -y xsel silversearcher-ag
apt install -y kazam gnome-tweaks vlc
apt install -y xz-utils unzip unrar

# -- graphviz
apt install -y cpanminus
cpanm Graph::Easy

# -- python packages
pip3 install --upgrade pip
pip3 install ipython tmuxp requests

# -- messanger
wget -O telegram.tar.xz -c https://telegram.org/dl/desktop/linux
tar xf telegram.tar.xz -C $USER_APPLICATION_PATH
wget -c https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb
wget -O slack-desktop-amd64.deb -c https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb
dpkg -i slack-desktop-amd64.deb

# -- music
apt install -y gnome-music
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt update
apt install -y spotify-client

# update
apt update
apt upgrade -y


echo 'Done ;)'
