#!/usr/bin/env bash 

cd ~/.dots/rofi

# Utils
source ~/.dots/util.sh
logfile install-rofi.log

# Install deps
deps rofi

link ~/.dots/rofi/config.rasi ~/.config/rofi/config.rasi
