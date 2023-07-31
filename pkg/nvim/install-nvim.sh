#!/usr/bin/env bash 

cd ~/.dots/pkg/nvim

# Utils
source ~/.dots/util.sh
logfile install-nvim.log

# Install deps
# deps
deps nvim

link ~/.dots/pkg/nvim/nvim ~/.config/nvim

log "installing packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

