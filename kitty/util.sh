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
  printf "[ERR] $1\n" >> $LOGFILE;
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

deps() {
  log "installing deps..";
  yay -S $@;
  check;
  return 0;
}
