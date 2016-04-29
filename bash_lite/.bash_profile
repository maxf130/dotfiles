export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export PATH="/home/max/.local/bin:${PATH}"
unset MANPATH

if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
