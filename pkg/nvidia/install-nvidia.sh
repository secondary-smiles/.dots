#!/usr/bin/env bash 

cd ~/.dots/pkg/nvidia

# Utils
source ~/.dots/util.sh
logfile install-nvidia.log

# Install deps
deps nvidia egl-wayland lib32-nvidia-utils libvdpau libxnvctrl nvidia-settings nvidia-utils nvtop

# Patch mkinitcpio
log "patching mkinitcpio"
log "linking ~/.dots/pkg/nvidia/mkinitcpio.conf to /etc/mkinitcpio.conf"
sudo ln -sf ~/.dots/pkg/nvidia/mkinitcpio.conf /etc/mkinitpcio.conf
check

log "rebuilding mkinitpcio"
sudo mkinitpcio -P
check

log "patching grub"
log "linking ~/.dots/pkg/nvidia/grub to /etc/default/grub"
sudo ln -sf ~/.dots/pkg/nvidia /etc/default/grub
check

log "updating grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg
check

# Configure xorg for gpu
log "setting xorg to use gpu"
sudo nvida-xconfig
check
