#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

# All 'packages' and dependencies [package]="dependencies"
needs["all"]=$(basename "$(ls -d */)")

# Install args or all
packages=${*:-all}

for pkg in $packages; do
  install "$pkg";
done