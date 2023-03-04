#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

# All 'packages' and dependencies [package]="dependencies"
needs["pacman"]=""
needs["yay"]="pacman"
needs["zsh"]="yay"
needs["helix"]="yay"
needs["kitty"]="yay"
needs["starship"]="yay zsh"
needs["i3-wm"]="yay kitty rofi wallpaper picom fonts"

needs["all"]=$(basename "$(ls -d */)")

# Install args or all
packages=${*:-all}

for pkg in $packages; do
  install "$pkg";
done