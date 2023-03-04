source ~/.dots/util.sh

warn "this will reset all logs and reset the installed list"

read -p "Do you want to proceed? [Y/n] " yn

case $yn in 
	Y|y|"" ) ;;
	N|n ) error "cancelled";;
	* ) error invalid response;;
esac

log "deleting installed list"
rm -f ~/.dots/installed

for log in $(find ~/.dots -name "*.log" -type f); do
  log "deleting $log"
  rm -f "$log"
done

# Cleanup logs created while logging files that will be deleted
log "performing selfclean"
for log in $(find ~/.dots -name "*.log" -type f); do
  rm -f "$log"
done
