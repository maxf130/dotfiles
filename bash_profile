export NPM_PACKAGES="$HOME/.npm-packages"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export PATH="/home/max/bin:$NPM_PACKAGES/bin:${PATH}"
export PATH="$PATH:/home/max/bin:$NPM_PACKAGES/bin:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
