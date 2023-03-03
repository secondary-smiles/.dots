#!/bin/bash

cd ~/.dots/zsh

# Utils
source ~/.dots/util.sh
logfile install-zsh.log

# Install deps
deps zsh curl starship

# install oh-my-zsh
log "setting up oh-my-zsh.."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
check

# change default shell
log "setting $(which zsh) as the default shell.."
sudo chsh -s /usr/bin/zsh $(whoami)
check

# link .zshrc file
log "symlinking .zshrc.."
link ~/.dots/zsh/.zshrc ~/.zshrc
check

# install zsh plugins
log "installing zsh-syntax-highlighting.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
check

log "installing zsh-autosuggestions.."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
check

log "setup zsh dotfiles successfully!"
