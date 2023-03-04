#!/usr/bin/env bash

# Utils
source ~/.dots/util.sh

log "creating install scripts"
# create install script
for folder in */; do
  file="$folder"install-$(basename "$folder").sh
  if test -e "$file"; then
    warn "skipping $file"
    chmod +x "$file";
  else
    path=$(basename "$folder")
    TEMPLATE="#!/usr/bin/env bash 

cd ~/.dots/$path

# Utils
source ~/.dots/util.sh
logfile install-$path.log

# Install deps
# deps
"
    echo "$TEMPLATE" > "$file";
    log "set up $file"
    chmod +x "$file";
  fi
done

log "creating dependency files"
# Create dep file
for folder in */; do
  file="$folder"deps-$(basename "$folder").sh
  if test -e "$file"; then
    warn "skipping $file"
    chmod +x "$file";
  else
    TEMPLATE="#!/usr/bin/env bash
# Utils
source ~/.dots/util.sh

# Register deps
needs[\"$(basename "$folder")\"]=\"\"
    "
    echo "$TEMPLATE" > "$file";
    log "set up $file"
    chmod +x "$file";
  fi
done
