# Allow other aliases to be executed as sudo
alias sudo="sudo "

alias la="ls -la"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias touch="create_file_and_folder"

# Git
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpu="git push --set-upstream origin '$(git symbolic-ref --short -q HEAD)'"
alias gl="git pull"
alias gst="git status"
alias gss="git stash"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gm="git merge"
alias gg="git log"
alias ggo="git log --oneline"
alias gt="git tree"

# Docker
alias d="docker"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dcd="docker-compose down"
alias dce="docker-compose exec"

# Utils
alias i.="idea ."
alias c.="code ."
alias v.="nvim ."
alias o.="open ."
