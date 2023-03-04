#!/usr/bin/env bash 

cd ~/.dots/pkg/fonts

# Utils
source ~/.dots/util.sh
logfile install-fonts.log

# Install deps
deps git noto-fonts-emoji

# Get all nerd fonts
log downloading all nerd fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
check

log "installing all fonts to system"
cd nerd-fonts
sudo sudo ./install.sh -Scq
check

cd ../
rm -rf nerd-fonts
