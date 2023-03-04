#!/usr/bin/env bash 

cd ~/.dots/i3wm

# Utils
source ~/.dots/util.sh
logfile install-i3wm.log

# Install deps
deps i3-wm kitty rofi bumblebee-status pulseaudio playerctl picom nitrogen

# Link config file
link ~/.dots/i3wm/config ~/.config/i3/config

# Enable pulseaudio daemon
log "enabling pulseaudio"
systemctl --user enable pulseaudio
systemctl --user start pulseaudio

# Apply changes
log "restarting i3wm"
i3-msg restart
check
