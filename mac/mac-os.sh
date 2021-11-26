#!/usr/bin/env bash

###############################################################################
# ⌨️ Keyboard
###############################################################################
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1         # Speed
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Speed

###############################################################################
# 👨‍💻 Dock
###############################################################################
for _ in $(seq 1 4); do defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; done # Add 4 spaces
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
killall Dock
