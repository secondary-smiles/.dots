#!/usr/bin/env bash 

cd ~/.dots/pacman

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
sudo  ln -sf ~/.dots/pacman/pacman.conf /etc/pacman.conf
check
