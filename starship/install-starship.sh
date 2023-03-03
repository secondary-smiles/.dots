#!/bin/bash

cd ~/.dots/starship

# Utils
source ~/.dots/util.sh
logfile install-starship.log

# Install deps
deps starship

# Link starship.toml
link ~/.dots/starship/starship.toml ~/.config/starship.toml
check

log "setup starship dotfiles susccessfully!"
