#!/usr/bin/env bash 

cd ~/.dots/wallpaper

# Utils
source ~/.dots/util.sh
logfile install-wallpaper.log

# Install deps
deps xorg nitrogen

log "setting wallpaper"
nitrogen --set-zoom-fill --random ~/.dots/wallpaper/files/ --save
