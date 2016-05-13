# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

eval `dircolors ~/.dir_colors`

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
GRAY=$(tput setaf 7)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# set up command prompt
function __prompt_command()
{
  # capture the exit status of the last command
  EXIT="$?"
  PS1=""

  if [ $EXIT -eq 0 ]; then PS1+="\[$GREEN\][\!]\[$RESET\] "; else PS1+="\[$RED\][\!]\[$RESET\] "; fi

  # if logged in via ssh shows the ip of the client
  if [ -n "$SSH_CLIENT" ]; then 
    IP=${SSH_CLIENT%% *}
    PS1+="\[$YELLOW\]("$IP")\[$RESET\]"; 
  fi

  # debian chroot stuff (take it or leave it)
  PS1+="${debian_chroot:+($debian_chroot)}"

  # basic information (user@host:path)
  PS1+="\[$RED$BOLD\]\u\[$RESET\]@\[$RED$BOLD\]\h\[$RESET\]:\[$BLUE\]\w\[$RESET\] "

  # check if inside git repo
  local git_status="`git status -unormal 2>&1`"    
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    # parse the porcelain output of git status
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      local Color_On=$GREEN
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local Color_On=$PURPLE
    else
      local Color_On=$RED
    fi

    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
    else
      # Detached HEAD. (branch=HEAD is a faster alternative.)
      branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`)"
    fi

    # add the result to prompt
    PS1+="\[$Color_On\][$branch]\[$RESET\] "
  fi

  # prompt $ or # for root
  PS1+="\$ "
}
PROMPT_COMMAND=__prompt_command
