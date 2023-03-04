#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

# All 'packages' and dependencies [package]="dependencies"
deps["yay"]=""
deps["zsh"]="yay"
deps["helix"]="yay"
deps["starship"]="yay zsh"
deps["i3-wm"]="yay kitty rofi wallpaper picom fonts"

deps["all"]=$(basename "$(ls -d */)")

# Install args or all
packages=${*:-all}

log "installing $packages"
for pkg in $packages; do
  install "$pkg";
done