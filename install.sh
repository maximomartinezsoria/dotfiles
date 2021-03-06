#!/usr/bin/env bash

brew update

# Allow keep a key pressed on mac
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Install zsh and oh-my-zsh
brew install zsh
chsh -s /usr/local/bin/zsh
compaudit | xargs chmod g-w,o-w

# Install zsh theme
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./oh-my-zsh/mms.zsh-theme ~/.oh-my-zsh/themes

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install vim and nvim
brew install vim nvim
cp -r nvim/ ~/.config/nvim

# Install Plug (Vim package manager)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install vim extensions
vim +'PlugInstall --sync' +qa

# Update git and install github cli
brew install git
brew install gh

# Copy config files
cp -r ./root/ ~/

# Install NVM, node, npm and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 12
nvm use 12
brew install yarn

# Install Python
brew install python

# Install ansible
pip3 install ansible==2.8.8

# Install server stuff
brew install nginx php mariadb composer

# Start services
brew link php --force
brew services start mariadb
brew services start nginx

# Install valet
composer global require laravel/valet
source ~/.zshrc # Need to refresh for valet to exist in PATH
valet install

# Install Fira Code
brew tap homebrew/cask-fonts
brew install font-fira-code
