# --- Plugins (sourced before everything) ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Tool init (fast, lazy where possible) ---
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"  # use Ctrl+R instead, less intrusive
eval "$(mise activate zsh)"

# --- fzf (Ctrl-T files, Alt-C cd; Ctrl-R is handled by atuin below) ---
command -v fzf >/dev/null && source <(fzf --zsh)

# --- Aliases (all live in aliases.sh) ---
DOTFILES="${${(%):-%x}:A:h:h}"   # resolves ~/.zshrc symlink -> repo root
source "$DOTFILES/aliases.sh"

# --- Atuin: Ctrl+R for history search ---
bindkey '^r' atuin-search

export PATH="$HOME/.local/bin:$PATH"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/maximomartinezsoria/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/maximomartinezsoria/Library/Application Support/Herd/bin/":$PATH
