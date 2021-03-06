# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Sample .profile for SuSE Linux 
# rewritten by Christian Steinruecken <cstein@suse.de> 
# 
# This file is read each time a login shell is started. 
# All other interactive shells will only read .bashrc; this is particularly 
# important for language settings, see below. 

test -z "$PROFILEREAD" && . /etc/profile || true 

# Most applications support several languages for their output. 
# To make use of this feature, simply uncomment one of the lines below or 
# add your own one (see /usr/share/locale/locale.alias for more codes) 
# This overwrites the system default set in /etc/sysconfig/language 
# in the variable RC_LANG. 
# 
#export LANG=de_DE.UTF-8        # uncomment this line for German output 
#export LANG=el_GR.UTF-8        # uncomment this line for Greek output
#export LANG=es_ES.UTF-8        # uncomment this line for Spanish output
#export LANG=fr_FR.UTF-8        # uncomment this line for French output 

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
else
    # set PATH so it includes user's private bin if it exists
    if [ -z $(grep "$HOME/bin" <<< $PATH) ] && [ -d "$HOME/bin" ] ; then
        PATH="$HOME/bin:$PATH"
        export PATH
    fi
    # set PATH so it includes user's private sbin if it exists
    if [ -z $(grep "$HOME/bin" <<< $PATH) ] && [ -d "$HOME/sbin" ] ; then
        PATH="$HOME/sbin:$PATH"
       export PATH
    fi
fi

# Since, you are not using GNOME, you might have to set the value of
# DESKTOP_SESSION in your profile.
#export DESKTOP_SESSION=gnome
