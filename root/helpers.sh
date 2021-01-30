#!/usr/bin/env bash

create_file_and_folder() 
{ 
  mkdir -p "$(dirname "$1")" || return; touch "$1"; 
}

# Add everything, commit and push
gacp()
{
  git add -A
  git commit -m "$1"
  git pull
  git push
}
