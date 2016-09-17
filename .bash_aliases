#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/
#                                    /_/           drxspace@gmail.com
#
#

# --------------------------------------------------------------------[ global ]
__DISTRO__=$(sed -n '/^ID=/s/ID=//p' /etc/*release 2>/dev/null)
# -----------------------------------------------------------------------------]

# ---------------------------------------------------------------------[ local ]
__DEBIANS__="debian|ubuntu|linuxmint|netrunner|elementary|zorin os"
__ARCHES__="arch|antergos|manjaro|apricity"
# -----------------------------------------------------------------------------]

if [[ ${__DISTRO__} =~ ${__DEBIANS__} ]]; then
	__IsInstalled__() {
		aptitude search $1 | awk 'BEGIN { app="" }
					 /^i/ { if ($2 != "A") app=app$2" ";  }
					 END { if (length(app) != 0) print app }'
	}
fi

if [[ $EUID -eq 0 ]]; then
	if [[ ${__DISTRO__} =~ ${__DEBIANS__} ]]; then
		# -------------------------------------------------------[ apt ]
		__ExPurge__() {
			apt autoremove --purge $(__IsInstalled__ ${1})
		}
		alias aptins='apt install'
		alias aptprg='apt autoremove --purge'
		alias aptrns='apt install --purge --reinstall'
		alias expurge='__ExPurge__'
		alias upall='updt -q ; aptclr ; orphclr'
		# -------------------------------------------------------------]
	elif [[ "${__DISTRO__}" == "fedora" ]]; then
		# -------------------------------------------------------[ dnf ]
		alias dcc='dnf autoremove ; dnf clean all'
		alias din='dnf install'
		alias dug='dnf check-update ; dnf upgrade'
		alias dup='dnf check-update ; dnf update'
		# -------------------------------------------------------------]
	elif [[ "${__DISTRO__}" == "opensuse" ]]; then
		# ----------------------------------------------------[ zypper ]
		alias zcc='zypper clean -a'
		alias zef='zypper refresh'
		alias zud='zypper dist-upgrade'
		alias zup='zypper update'
		# -------------------------------------------------------------]
	elif [[ "${__DISTRO__}" =~ ${__ARCHES__} ]]; then
		# ----------------------------------------------------[ pacman ]
		alias archall='yup ; ycc'
		alias archun='pacman -Rsun'
		# -------------------------------------------------------------]
	fi

	# --------------------------------------------------------[ Networking ]
	alias netlst='netstat -tulpn | grep LISTEN'
	alias ports='netstat -tulpn'
	# ---------------------------------------------------------------------]

	# --------------------------------------------------------------[ Misc ]
	alias rm='rm -i'
	# ---------------------------------------------------------------------]
fi

# ------------------------------------------------------------------------[ ls ]
alias dl='ls -d {.*,*}/ -1'
alias d='ls -d */ -1'
alias lf='ls -1Ap | grep -v /$'
alias lia='ls -lia'
alias ll='ls -AlhF --group-directories-first --time-style=long-iso'
# -----------------------------------------------------------------------------]

# -----------------------------------------------------------------------[ git ]
[[ $(which git 2>/dev/null) ]] && {

	__PullAllGitHubs__() {
		pushd . >/dev/null;
		echo -e ":: \033[1mThe git repositories pulling process starts...\033[0m"
		[[ -d "$HOME"/gitProjects/ ]] && { [[ "$1" = "-p" ]] || [[ "$1" = "-a" ]] || [[ "$1" = "" ]] ; } && {
			cd "$HOME"/gitProjects/;
			echo -e "\n\033[1mI'm pulling the gitProjects directories...\033[0m\n";
			for d in $(ls -d */ -1)
			do
				echo -e "\033[1mGetting into ${d}\033[0m"; cd "${d}";
				echo "Pulling GitHub's data...";
				git pull || break;
				echo "Cleaning the repository...";
				git clean -d -f || break;
				cd ..;
			done;
		}
		[[ -d "$HOME"/gitClones/ ]] && { [[ "$1" = "-c" ]] || [[ "$1" = "-a" ]] || [[ "$1" = "" ]] ; } && {
			cd "$HOME"/gitClones/;
			echo -e "\n\033[1mI'm pulling the gitClones directories...\033[0m\n";
			for d in $(ls -d */ -1)
			do
				echo -e "\033[1mGetting into ${d}\033[0m"; cd "${d}";
				echo "Pulling GitHub's data...";
				git pull || break;
				echo "Cleaning the repository...";
				git clean -d -f || break;
				cd ..;
			done;
		}
		[[ -d "$HOME"/gitDirs/ ]] && { [[ "$1" = "-d" ]] || [[ "$1" = "-a" ]] || [[ "$1" = "" ]] ; } && {
			cd "$HOME"/gitDirs/;
			echo -e "\n\033[1mI'm pulling the gitDirs directories...\033[0m\n";
			for d in $(ls -d */ -1)
			do
				echo -e "\033[1mGetting into ${d}\033[0m"; cd "${d}";
				echo "Pulling GitHub's data...";
				git pull || break;
				echo "Cleaning the repository...";
				git clean -d -f || break;
				cd ..;
			done;
		}
		echo -e "\n:: \033[1mThe git repositories pulling process finished.\033[0m"
		popd >/dev/null;
	}

	alias ga='git add'
	alias gb='git branch -a'
	alias gc='git checkout'
	alias gcln='git clone --depth 1'
	alias gclr='git clean -d -f'
	alias gcam='git commit -am'
	alias gd='git diff'
	alias gitget='__PullAllGitHubs__'
	alias gl='git log'
	alias gmv='git mv'
	alias grm='git rm'
	alias gs='git status'
	alias gull='git pull'
	alias gundo='git reset --hard'
	alias gush='git push'
}
# -----------------------------------------------------------------------------]

# ----------------------------------------------------------------------[ Misc ]

if [[ ${__DISTRO__} =~ ${__DEBIANS__} ]]; then
	alias isins='__IsInstalled__'
fi

alias ..='cd ..'
alias ...='cd ../..'
__BrokenLinks__() {
	sudo find . -mount -type l -exec sh -c 'file -b "{}" | grep -q ^broken' \; -print
}
alias brokln='__BrokenLinks__'
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias blkid='sudo blkid | sort'
[[ $(which bleachbit 2>/dev/null) ]] && alias clean='bleachbit --preset --clean | grep -v "^[debug|info]"'
[[ $(which colordiff 2>/dev/null) ]] && alias diff='colordiff'
alias briff='diff --brief -r'
alias distro='echo ${__DISTRO__}'
alias ka='killall'
alias ska='sudo killall'
alias kbd='sudo kbdrate -s -r 22.0 -d 640'
[[ $(which gnome-session-quit 2>/dev/null) ]] && alias logoff='gnome-session-quit'
alias MyFiles='chown -R $(id -un):$(id -gn) 2>/dev/null'
alias Mine='sudo chown -R $(id -un):$(id -gn)'
alias Gods='sudo chown -R root:root'
[[ $(which speedtest_cli 2>/dev/null) ]] && alias inetspeed='$(which speedtest_cli)'
alias noless='grep -Ev '\''^(#|$)'\'''
alias path='echo -e ${PATH//:/\\n}'
alias shutup='sudo shutdown -h now'
alias srch='sudo find / -mount -iname'
alias S='sudo'
[[ $(which youtube-dl 2>/dev/null) ]] && {
	alias vdu2me='youtube-dl -q --console-title -o "%(title)s.%(ext)s" --write-sub --sub-lang "en,el"'
	alias you2me='youtube-dl -q --console-title -o "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 1'
}
alias tmount='mount | column -t'
alias wmesg='dmesg | grep -Ei "(error|warn|fail|taint|disa)"'
# -----------------------------------------------------------------------------]

# ---------------------------------------------------------------------[ Other ]
if [ ${VC:=0} -eq 0 ]; then
	if [ $EUID -ne 0 ]; then
		#PS1='\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]\[\e[0m\]\[\e[0;36m\]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]'
		PS1=$'\[\033[33;44m\]\u @ \h \[\033[m\]\[\033[34;43m\]\u25b6 \W \[\033[m\]\[\033[33m\]\u25B6\[\033[m\] '
	else
		PS1="\342\225\255\342\224\244\[\e[0;96m\]\u@\h \342\232\231 \w\[\e[0;0m\]\342\224\234\342\210\230\n\342\225\260\342\224\200\342\232\231 "
	fi
fi
# -----------------------------------------------------------------------------]

unset __DEBIANS__
unset __ARCHES__
