#
# ~/.bashrc
#
# If interactive + non-login shell → /etc/bash.bashrc then ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running in a virtual console, tell it
[[ "$(tty)" == *pts* ]] && VC=0 || VC=1

# enable color support of ls and also add handy aliases
if [[ $VC -eq 0 ]] && [[ -x /usr/bin/dircolors ]] ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private sbin if it exists
if [ -d "$HOME/sbin" ] ; then
    PATH="$HOME/sbin:$PATH"
fi
export PATH

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

if [[ $EUID -ne 0 ]]; then fortune | cowsay -f turtle; fi

unset VC
