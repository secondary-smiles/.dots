#!/usr/bin/env bash

# Utility functions

#####################
# Logging Functions #
#####################

# Reset styles
RESET='\x1b[0m'

# Logfile
LOGFILE='install.log'

# Last logged command
LAST=''

logfile() {
  LOGFILE=$1
  > $LOGFILE;
  check;

  log "set logfile $LOGFILE";
  return 0;
}

log() {
  printf "\x1b[1;36minfo:$RESET $1 $RESET\n";
  printf "[INFO] $1\n" >> $LOGFILE;
  LAST=$1;
  return 0;
}

warn() {
  printf "\x1b[1;33mwarn:$RESET $1 $RESET\n";
  printf "[WARN] $1\n" >> $LOGFILE;
  LAST=$1;
  return 0;
}

error() {
  printf "\x1b[1;31merror:$RESET $1 $RESET\n";
  printf "[ERR]  $1\n" >> $LOGFILE;
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
# Package to install for this instance is '$1'
install() {
  # Check if already installed
  if grep -xq "$1" ~/.dots/installed; then
    error "$1 is already installed"
  fi

  if test -e ~/.dots/"$1"/deps-"$1".sh; then
    source ~/.dots/$1/deps-$1.sh;
  fi
  
  log "checking dependencies for $1: '${needs[$1]}'"

  for need in ${needs[$1]}; do
    if grep -xq "$need" ~/.dots/installed; then
      log "dependency $need already installed";
      continue;
    else
      warn "dependency $need not installed. installing.";  
      install "$need";
      check;
    fi
  done

  log "installing $1";
  /usr/bin/env bash ~/.dots/"$1"/install-"$1".sh;
  check

  echo "$1" >> ~/.dots/installed

  log "setup $1 successfully!";

  return 0;
}


TEMPLATE=""

template() {
path=$(basename $1)
TEMPLATE="#!/usr/bin/env bash 

cd ~/.dots/$path

# Utils
source ~/.dots/util.sh
logfile install-$path.log

# Install deps
# deps
"
}
