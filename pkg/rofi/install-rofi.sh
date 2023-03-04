#!/usr/bin/env bash 

cd ~/.dots/pkg/rofi

# Utils
source ~/.dots/util.sh
logfile install-rofi.log

# Install deps
deps rofi

link ~/.dots/pkg/rofi/config.rasi ~/.config/rofi/config.rasi
