#!/usr/bin/env bash

cd ~/.dots


# Utils
source ~/.dots/util.sh
logfile install.log

# All 'packages'

deps["yay"]=""
deps["zsh"]="yay"
deps["helix"]="yay"
deps["starship"]="yay zsh"

install starship