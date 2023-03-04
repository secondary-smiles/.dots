#!/usr/bin/env bash

# Utility functions

#####################
# Logging Functions #
#####################

# Reset styles
RESET='\x1b[0m'

# Logfile
LOGFILE='install.log'
# Global logfile
GLOBAL_LOGFILE="$HOME/.dots/global-log.log"

# Last logged command
LAST=''

logfile() {
  LOGFILE=$1
  true > "$LOGFILE";
  check;

  log "set logfile $LOGFILE";
  return 0;
}

log() {
  printf "\x1b[1;36minfo:%b %s %b\n" "$RESET" "$*" "$RESET";
  printf "[INFO] %s\n" "$*" >> "$LOGFILE";
  printf "[INFO] %s\n" "$*" >> "$GLOBAL_LOGFILE";
  LAST=$*;
  return 0;
}

warn() {
  printf "\x1b[1;33mwarn:%b %s %b\n" "$RESET" "$*" "$RESET";
  printf "[WARN] %s\n" "$*" >> "$LOGFILE";
  printf "[WARN] %s\n" "$*" >> "$GLOBAL_LOGFILE";
  LAST=$1;
  return 0;
}

error() {
  printf "\x1b[1;31merror:%b %s %b\n" "$RESET" "$*" "$RESET";
  printf "[ERR]  %s\n" "$*" >> "$LOGFILE";
  printf "[ERR]  %s\n" "$*" >> "$GLOBAL_LOGFILE";
  LAST=$1;
  exit 1;
}

check() {
  if [ $? -ne 0 ]; then
    error "failed at: '$LAST'";
  else
    return 0;
  fi
}

###################
# Other Functions #
###################

# Install packages from yay or pacman
deps() {
  log "installing deps: $*";

  for dep in "$@"; do
    if ! pacman -Qs ^"$dep"$ &> /dev/null; then
      yay -S "$dep" || sudo pacman -S "$dep";
      check;
    fi 
  done;
  
  return 0;
}

# Symlink + mkdir -p
link() {
  log "linking $1 to $2";

  destdir="${2%/*}/";
  mkdir -p "$destdir";
  
  ln -sf "$1" "$2";
  check
  return 0;
}

declare -A needs

# Run install script + dependencies
# Package to install for this instance is '$1', nocheck will disable dep checks, '$2' is the caller for recursive functions
install() {
  local nocheck=0
  if [[ "$1" == "nocheck" ]]; then
    shift
    nocheck=1
  fi

  # Check if already installed
  if grep -xq "$1" ~/.dots/pkg/installed; then
    log "$1 is already installed"
    exit 0;
  fi

  if test -e ~/.dots/pkg/"$1"/deps-"$1".sh; then
    source ~/.dots/pkg/"$1"/deps-"$1".sh;
  fi
  
  if [[ "$nocheck" == "0" ]]; 
  then
    log "checking dependencies for $1: '${needs[$1]}'"
    for need in ${needs[$1]}; do
      if grep -xq "$need" ~/.dots/pkg/installed; then
        log "dependency $need already installed";
        continue;
      else
        warn "dependency $need not installed. installing.";  
        if [[ "$2" == "$need" ]]; then
          warn "cyclic dependency detected between $1 and $need"
          install nocheck "$need" "${2:-$1}";
        fi
        install "$need" "${2:-$1}";
        check;
      fi
    done
  else
    warn "installing $1 without checking dependencies (likely because of dependency loop)"
    warn "this can break stuff"
    prompt
  fi

  log "installing $1";
  /usr/bin/env bash ~/.dots/pkg/"$1"/install-"$1".sh;
  check

  echo "$1" >> ~/.dots/pkg/installed

  log "setup $1 successfully!";

  return 0;
}

prompt() {
  read -rp "Do you want to proceed? [Y/n] " yn

  case $yn in 
  	Y|y|"" ) return 0;;
  	N|n ) error "cancelled";;
  	* ) error invalid response;;
  esac
}