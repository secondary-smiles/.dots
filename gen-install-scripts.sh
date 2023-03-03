#!/bin/bash

# create install script
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && touch install-$(basename "$PWD").sh' \;

# add utils
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && cp ../util.sh .' \;

# add execute perms
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && chmod +x install-$(basename "$PWD").sh' \;
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && chmod +x util.sh' \;
