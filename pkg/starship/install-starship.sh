#!/usr/bin/env bash

cd ~/.dots/pkg/starship

# Utils
source ~/.dots/util.sh
logfile install-starship.log

# Install deps
deps starship

# Link starship.toml
link ~/.dots/pkg/starship/starship.toml ~/.config/starship.toml
