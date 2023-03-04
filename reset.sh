source ~/.dots/util.sh
logfile "cleanup.log"

warn "this will reset all logs and reset the installed list"

prompt

log "resetting installed list ~/.dots/pkg/installed"
rm -f ~/.dots/pkg/installed
: > ~/.dots/pkg/installed

for log in $(find ~/.dots -name "*.log" -type f); do
  log "deleting $log"
  rm -f "$log"
done

# Cleanup logs created while logging files that will be deleted
log "performing selfclean"
for log in $(find ~/.dots -name "*.log" -type f); do
  rm -f "$log"
done
