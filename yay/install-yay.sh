#!/usr/bin/env bash

cd ~/.dots/yay

# Utils
source ~/.dots/util.sh
logfile install-yay.log

# Install deps
deps git

# Clone 'yay' git repo
log "cloning yay from https://aur.archlinux.org/yay.git"
git clone https://aur.archlinux.org/yay.git yay-git
check

# Install 'yay'
log "building yay"
cd yay-git
makepkg -si
check

# Cleanup git repo
cd ../
rm -rf yay-git
check

link ~/.dots/yay/config.json ~/.config/yay/config.json
