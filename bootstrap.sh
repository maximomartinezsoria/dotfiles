#!/usr/bin/env bash

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Packages (CLI tools + VSCode extensions) from the Brewfile
brew bundle --file="$DOTFILES_PATH/Brewfile"

# 3. Language runtimes — Neovim's LSP servers/formatters (vtsls, eslint, prettier…) need Node
mise use -g node@lts python@latest
corepack enable 2>/dev/null || true

# 4. Zsh plugins (no framework, just two files)
mkdir -p ~/.zsh
[ -d ~/.zsh/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# 5. macOS defaults + symlinks
source "$DOTFILES_PATH/mac/mac-os.sh"
source "$DOTFILES_PATH/symlinks.sh"

echo "✅ Bootstrap complete. Open nvim once so lazy.nvim + Mason finish installing plugins/servers."
