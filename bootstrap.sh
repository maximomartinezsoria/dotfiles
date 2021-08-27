#!/usr/bin/env bash

source "$DOTFILES_PATH/scripts/core/install.sh"

install_brew
install_brew_apps

set_zsh_default_shell

install_nvm
install_valet

source "$DOTFILES_PATH/mac/mac-os.sh"
source "$DOTFILES_PATH/symlinks.sh"

chmod -R u+x "$DOTFILES_PATH/scripts"
