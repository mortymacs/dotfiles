#!/bin/sh
echo 'forward-socks5t   /               127.0.0.1:9050 .' >> /etc/privoxy/config

sudo systemctl enable tor
sudo systemctl enable privoxy
