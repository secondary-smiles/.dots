#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

# All 'packages' and dependencies [package]="dependencies"
# Lists all nonhidden folders
needs["all"]=$(find . -mindepth 1 -maxdepth 1 -type d -not -path '*/.*' -exec basename {} \;)

# Install args or all
packages=${*:-all}

for pkg in $packages; do
  install "$pkg";
done