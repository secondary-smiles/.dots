#!/usr/bin/env bash 

cd ~/.dots/pkg/pacman

# Utils
source ~/.dots/util.sh
logfile install-pacman.log

# Install deps
# deps

# Make sure pacman is present
if ! command -v pacman &> /dev/null
then
  error "pacman is not installed. Please ensure that it is"
fi

# Link pacman.conf
log "linking ~/.dots/pacman/pacman.conf to /etc/pacman.conf"
sudo  ln -sf ~/.dots/pkg/pacman/pacman.conf /etc/pacman.conf
check
