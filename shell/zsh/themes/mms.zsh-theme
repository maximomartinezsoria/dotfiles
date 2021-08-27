#!/usr/bin/env zsh

[[ $(echotc Co) -gt 100 ]] && support_color_tones=true || support_color_tones=false

status_icon_ok="➜"
status_icon_ko="▪"
vcs_icon="\uE0A0"
git_no_changes_status="✓"
git_dirty_status="✗"

git_branch_color="green"
git_dirty_status_color="yellow"
git_no_changes_status_color="white"
git_on_branch_color="white"
pwd_color="yellow"
status_icon_color="white"
[[ $support_color_tones = true ]] && ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'

prompt_pwd() {
  source "$DOTFILES_PATH/scripts/core/short_pwd.sh"
  local prompt_dir=$(short_pwd)
  print -n "%F{$pwd_color}${prompt_dir}"
}

prompt_git() {
  [[ -n ${git_info} ]] && print -n "%F{$git_on_branch_color} ${vcs_icon}${(e)git_info[prompt]}"
}

precmd() {
  (( ${+functions[git-info]} )) && git-info
}

prompt_setup() {
  local prompt_status="%(?:%F{green}%F{$status_icon_color}$status_icon_ok%F{green}:%F{red}%F{$status_icon_color}$status_icon_ko%F{red})"

  zstyle ':zim:git-info:branch' format "%F{$git_branch_color}%b"
  zstyle ':zim:git-info:commit' format "%c"
  zstyle ':zim:git-info:clean' format "%F{$git_no_changes_status_color}$git_no_changes_status"
  zstyle ':zim:git-info:dirty' format "%F{$git_dirty_status_color}$git_dirty_status"
  zstyle ':zim:git-info:keys' format "prompt" " %F{cyan}%b%c %C%D"

  PROMPT="${prompt_status} \$(prompt_pwd)\$(prompt_git)%f "

  RPS1=''
}

prompt_setup "${@}"
