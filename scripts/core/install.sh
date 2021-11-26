#!/usr/bin/env bash

function install_brew() {
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
}

function install_brew_apps() {
  brew bundle --file="$DOTFILES_PATH/mac/Homebrew/Brewfile" --force
}

function install_zim () {
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
}

function set_zsh_default_shell() {
  chsh -s /usr/local/bin/zsh
  compaudit | xargs chmod g-w,o-w
}

function install_nvm() {
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1))
  ) && \. "$NVM_DIR/nvm.sh"
}

function install_valet() {
  composer global require laravel/valet
  valet install
}
