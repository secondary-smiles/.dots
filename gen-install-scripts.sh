#!/usr/bin/env bash

# Utils
source ~/.dots/util.sh

# create install script
for folder in */; do
  file="$folder"install-$(basename $folder).sh
  if test -e $file; then
    warn "skipping $file"
    chmod +x $file;
  else
    template $folder;
    echo "$TEMPLATE" > $file;
    log "set up $file"
    chmod +x $file;
  fi
done
