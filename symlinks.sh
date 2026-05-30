#!/usr/bin/env bash

# Self-locate the repo if not invoked via bootstrap, so running this standalone
# can never produce broken "/foo" links from an empty $DOTFILES_PATH.
: "${DOTFILES_PATH:=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

# link <path-in-repo> <destination>
# -sfn = symbolic, force-replace, and never descend into an existing dir symlink
link() {
  mkdir -p "$(dirname "$2")"
  ln -sfn "$DOTFILES_PATH/$1" "$2"
}

link editors/nvim           "$HOME/.config/nvim"
link editors/vim/.vimrc     "$HOME/.vimrc"
link git/.gitconfig         "$HOME/.gitconfig"
link mac/karabiner          "$HOME/.config/karabiner"
link zsh/.zshrc             "$HOME/.zshrc"
link starship/starship.toml "$HOME/.config/starship.toml"
link ghostty/config         "$HOME/.config/ghostty/config"
