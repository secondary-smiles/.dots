#!/usr/bin/env bash 

cd ~/.dots/pkg/wallpaper

# Utils
source ~/.dots/util.sh
logfile install-wallpaper.log

# Install deps
deps xorg nitrogen

log "setting wallpaper"
nitrogen --set-zoom-fill --random ~/.dots/pkg/wallpaper/files/ --save
