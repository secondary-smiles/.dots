#!/usr/bin/env bash
# Utils
source ~/.dots/util.sh

# Register deps
# All 'packages' and dependencies [package]="dependencies"
# Lists all nonhidden folders
needs["all"]=$(find pkg -mindepth 1 -maxdepth 1 -type d -not -path '*/.*' -not -path '*/all' | xargs -n1 basename)
  
