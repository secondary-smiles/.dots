#!/usr/bin/env bash 

cd ~/.dots/pkg/kakoune

# Utils
source ~/.dots/util.sh
logfile install-kakoune.log

# Install deps
deps kakoune

# Link files
link ~/.dots/pkg/kakoune/kakrc ~/.config/kak/kakrc

# Setup plug.kak
log "installing plug.kak"
mkdir -p $HOME/.config/kak/plugins
git clone https://github.com/andreyorst/plug.kak.git $HOME/.config/kak/plugins/plug.kak
