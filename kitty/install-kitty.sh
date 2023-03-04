#!/usr/bin/env bash 

cd ~/.dots/kitty

# Utils
source ~/.dots/util.sh
logfile install-kitty.log

# Install deps
deps kitty

# Link kitty.conf and colors.conf
link ~/.dots/kitty/kitty.conf ~/.config/kitty/kitty.conf
link ~/.dots/kitty/colors.conf ~/.config/kitty/colors.conf
