#!/usr/bin/env bash 

cd ~/.dots/pkg/git

# Utils
source ~/.dots/util.sh
logfile install-git.log

# Install deps
deps github-cli xdg-utils

# Setup credential manager
log "authenticating with github cli"
gh auth login
check

gh auth setup-git
check

# Set git settings
log "setting git settings"
git config --global init.defaultBranch main
check
