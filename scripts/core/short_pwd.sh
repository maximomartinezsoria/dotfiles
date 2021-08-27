#!/usr/bin/env zsh

set -euo pipefail

##? Show short version of $PWD
##?
##? Usage:
##?    short_pwd

function short_pwd() {
  if [[ $(pwd) == "$HOME" ]]; then
    echo "~"
  else
    echo ${PWD##*/}
  fi
}
