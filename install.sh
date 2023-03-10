#!/usr/bin/env bash

cd ~/.dots

# Utils
source ~/.dots/util.sh
logfile install.log

nocheck=""

if [ "$1" = "nocheck"  ]; then
	nocheck="nocheck"
	shift
fi;

# Install args or all
packages=${*:-all}

for pkg in $packages; do
	if [ "$nocheck" = "nocheck" ]; then 
	  install nocheck "$pkg";
	else
	  install "$pkg";
	fi
done
