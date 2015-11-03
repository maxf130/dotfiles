#!/bin/zsh

# zsh config file

# Completion
autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Correction - zsh will correct mispelt commands
setopt correctall

# Prompt - Set prompt to gentoo
autoload -U promptinit
promptinit
autoload -U colors && colors

autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%s-[%b]"
PROMPT="%F{green}%n@%m%k %B%F{blue}%3~ %# %b%f%k"
RPROMPT="%B%F{blue} \${vcs_info_msg_0_} %(?..%F{red}<%?>)"

# Command history
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

setopt hist_ignore_all_dups
setopt hist_ignore_space

# Misc
setopt autocd

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
