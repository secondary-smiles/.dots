#!/usr/bin/env bash 

cd ~/.dots/pkg/picom

# Utils
source ~/.dots/util.sh
logfile install-picom.log

# Install deps
deps picom

link ~/.dots/pkg/picom/picom.conf ~/.config/picom.conf
