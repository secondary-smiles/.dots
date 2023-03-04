#!/usr/bin/env bash

# Utils
source ./util.sh

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

# add execute perms
# find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && chmod +x install-$(basename "$PWD").sh' \;
