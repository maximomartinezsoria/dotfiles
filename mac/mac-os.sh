#!/usr/bin/env bash

###############################################################################
# ⌨️ Keyboard
###############################################################################
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1         # Speed
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Speed
