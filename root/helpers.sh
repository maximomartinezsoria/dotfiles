#!/usr/bin/env bash

ttouch() 
{ 
  mkdir -p "$(dirname "$1")" || return; touch "$1"; 
}

