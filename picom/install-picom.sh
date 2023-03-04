#!/usr/bin/env bash 

cd ~/.dots/picom

# Utils
source ~/.dots/util.sh
logfile install-picom.log

# Install deps
deps picom

link ~/.dots/picom/picom.conf ~/.config/picom.conf
