#!/usr/bin/env bash

# Install Brew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
brew update

# Install zsh and oh-my-zsh
brew install zsh
chsh -s /usr/local/bin/zsh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
cp mms.zsh-theme ~/.oh-my-zsh/themes

# Install vim and nvim
brew install vim nvim
cp -r nvim/ ~/.config/nvim

# Install git and github cli
brew install git
brew install gh

# Copy config files
cp -r ./root/ ~/

# Install NVM, node, npm and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
nvm install 12
nvm use 12
brew install yarn

# Install Python
brew install python

# Install ansible
pip3 install ansible==2.8.8

# Install server stuff
brew install nginx php@7.2 mariadb composer
composer global require laravel/valet
valet install

# Install Fira Code
brew tap homebrew/cask-fonts
brew cask install font-fira-code