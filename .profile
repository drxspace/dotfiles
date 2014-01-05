# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
elif [ -d "$HOME/bin" ] ; then
    # set PATH so it includes user's private bin if it exists
    export PATH="$HOME/bin:$PATH"
fi

# In order to use Qt, some environment variables needs to be extended.
#export PATH=/usr/local/Trolltech/Qt-4.8.4/bin:$PATH
