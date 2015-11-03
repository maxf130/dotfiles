export NPM_PACKAGES="$HOME/.npm-packages"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export PATH="/home/max/bin:$NPM_PACKAGES/bin:${PATH}"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

alias emacs="emacs -nw"
alias ls="ls --color=auto"
alias la="ls -la"
