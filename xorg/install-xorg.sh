#!/usr/bin/env bash 

cd ~/.dots/xorg

# Utils
source ~/.dots/util.sh
logfile install-xorg.log

# Install deps
deps ly xorg

# Setup login manager
log "setting up ly as the default login manager"
sudo systemctl enable ly.service
check
