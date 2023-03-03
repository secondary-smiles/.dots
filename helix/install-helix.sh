#!/usr/bin/env bash

cd ~/.dots/helix

# Utils
source ~/.dots/util.sh
logfile install-helix.log

# Install deps
deps helix

# Setup grammar
log "fetching and building grammar"
sudo helix --grammar fetch
sudo helix --grammar build
check

# Link config.toml
link ~/.dots/helix/config.toml  ~/.config/helix/config.toml
