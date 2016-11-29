case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.




if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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


# This changes the prompt

#export PS1="\[\033[38;5;11m\]╭\[\033[38;5;57m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]-\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]-\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\d,\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;11m\]\@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]╰>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export PS1="\[$(tput bold)\]\[\033[38;5;11m\]╭\[\033[38;5;57m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]-\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;10m\]➡ pizzasperoni\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]-\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\][\[\033[38;5;202m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;11m\]\@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;56m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput bold)\]\[$(tput bold)\]\[\033[38;5;11m\]╰>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"



alias up='sudo apt-get update && sudo apt-get upgrade'

export LOCAL=$HOME/.local/install
export NODE_PATH=$LOCAL/node/bin

export PATH=$NODE_PATH:$PATH

alias backend='cd /home/yourUserHere/Development/BackEnd'
alias frontend='cd /home/yourUserHere/Development/Front-End'
export NODE_PATH=/home/yourUserHere/.local/install/node/bin:/home/yourUserHere/.local/install/node/lib/node_modules
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/work


