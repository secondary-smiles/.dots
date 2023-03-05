#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

# Install args or all
packages=${*:-all}

for pkg in $packages; do
  install "$pkg";
done