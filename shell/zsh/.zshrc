# Uncomment for debugging
# zmodload zsh/zprof

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS # Removes duplicates commands from history
setopt HIST_FCNTL_LOCK # Better performance for history I/O. Might be problematic on old operating systems.

# Start zim
source "$ZIM_HOME/init.zsh"

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source "$DOTFILES_PATH/shell/init.sh"
source "$DOTFILES_PATH/shell/zsh/themes/mms.zsh-theme"
source "$DOTFILES_PATH/shell/zsh/bindings/reverse_search.zsh"

# Uncomment to debug
# zprof
