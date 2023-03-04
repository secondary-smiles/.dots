#!/usr/bin/env bash

# Utility functions

#####################
# Logging Functions #
#####################

# Reset styles
RESET='\x1b[0m'

# Logfile
LOGFILE='logger.log'

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

declare -A deps
INSTALLED=()

# Install packages from yay or pacman
deps() {
  log "installing deps: $(echo $@)";
  yay -S $@ || sudo pacman -S $@;
  check;
  return 0;
}

# Symlink + mkdir -p
link() {
  log "linking $1 to $2";

  destdir="${2%/*}/";
  mkdir -p $destdir;
  
  ln -sf $1 $2;
  check
  return 0;
}

# Run install script + dependencies
# Package to install for this instance is '$1'
install() {
  log "checking dependencies for $1: '${deps[$1]}'"

  for dep in ${deps[$1]}; do
    if [[ " ${INSTALLED[*]} " =~ " ${dep} "  ]]; then
      log "dependency $dep already installed";
      continue;
    else
      warn "dependency $dep not installed. installing.";  
      install $dep;
      check;
    fi
  done

  log "installing $1";
  /usr/bin/env bash ~/.dots/$1/install-$1.sh;
  check

  INSTALLED+=($1);

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
