export NPM_PACKAGES="$HOME/.npm-packages"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export PATH="/home/max/bin:$NPM_PACKAGES/bin:${PATH}"
export PATH="$PATH:/home/max/bin:$NPM_PACKAGES/bin:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
