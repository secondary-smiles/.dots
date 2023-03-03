#!/bin/bash

# create install script
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && touch install-$(basename "$PWD").sh' \;

# add execute perms
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && chmod +x install-$(basename "$PWD").sh' \;
