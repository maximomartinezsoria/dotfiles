export EDITOR='vim'
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

export PATH="$PATH:/Users/$(whoami)/.composer/vendor/bin"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$DOTFILES_PATH/bin:$PATH"
