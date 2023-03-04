#!/usr/bin/env bash

cd ~/.dots/zsh

# Utils
source ~/.dots/util.sh
logfile install-zsh.log

# Install deps
deps zsh curl starship

if [ -z "$ZSH" ]; then
  # install oh-my-zsh
  log "setting up oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  check
fi
# change default shell
log "setting /usr/bin/zsh as the default shell"
sudo chsh -s /usr/bin/zsh "$(whoami)"
check

# link .zshrc file
link ~/.dots/zsh/.zshrc ~/.zshrc
check

# install zsh plugins
log "installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting || true

log "installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions || true