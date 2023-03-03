#!/usr/bin/env bash

# create install script
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'source ~/.dots/util.sh;  cd "{}" && ls install-$(basename "$PWD").sh || template "$PWD" && echo "$TEMPLATE" > install-$(basename "$PWD").sh' \;

# add execute perms
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && chmod +x install-$(basename "$PWD").sh' \;
