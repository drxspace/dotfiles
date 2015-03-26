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
DISTRO=$(cat /etc/*release 2>/dev/null | awk -F'=' '/^ID=/ { thisdistro=$2; } END { print tolower(thisdistro) }')
# -----------------------------------------------------------------------------]

debians="debian|ubuntu|netrunner|elementary os"

if [[ $EUID -eq 0 ]]; then
	if [[ ${DISTRO} =~ ${debians} ]]; then
		# -------------------------------------------------------[ apt ]
		alias aptins='apt-get install'
		alias aptprg='apt-get autoremove --purge'
		alias aptrns='apt-get install --purge --reinstall'
		alias upall='updt -q ; aptclr ; orphclr'
		# -------------------------------------------------------------]
	elif [[ "${DISTRO}" == "fedora" ]]; then
		# -------------------------------------------------------[ yum ]
		alias ycc='yum autoremove ; yum clean all'
		alias yin='yum install'
		alias yug='yum check-update ; yum upgrade --skip-broken'
		alias yup='yum check-update ; yum update --skip-broken'
		# -------------------------------------------------------------]
	elif [[ "${DISTRO}" == "opensuse" ]]; then
		# ----------------------------------------------------[ zypper ]
		alias zcc='zypper clean -a'
		alias zef='zypper refresh'
		alias zud='zypper dist-upgrade'
		alias zup='zypper update'
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
alias ll='ls -AlhF --group-directories-first'
# -----------------------------------------------------------------------------]

# -----------------------------------------------------------------------[ git ]
[[ $(which git 2>/dev/null) ]] && {

	__PullAllGitHubs__() {
		[[ -d ~/gitProjects/ ]] && {
			pushd . >/dev/null;
			cd ~/gitProjects/;
		} || exit 1;
		for d in $(ls -d */ -1)
		do
			echo "Getting into $d"; cd "$d";
			echo "Pulling GitHub's data...";
			git pull || break;
			cd ..;
		done;
		popd >/dev/null;
	}

	alias ga='git add'
	alias gb='git branch -a'
	alias gc='git checkout'
	alias gcm='git commit -am'
	alias gd='git diff'
	alias gitget='__PullAllGitHubs__'
	alias gl='git log'
	alias gs='git status'
	alias gull='git pull'
	alias gush='git push'
}
# -----------------------------------------------------------------------------]

# ----------------------------------------------------------------------[ Misc ]
alias ..='cd ..'
alias ...='cd ../..'
[[ $(which bleachbit 2>/dev/null) ]] && alias clean='bleachbit --preset --clean | grep -v "^[debug|info]"'
[[ $(which colordiff 2>/dev/null) ]] && alias diff='colordiff'
alias distro='echo ${DISTRO}'
alias ka='killall'
alias kbd='sudo kbdrate -r 24 -d 750'
[[ $(which gnome-session-quit 2>/dev/null) ]] && alias logoff='gnome-session-quit'
alias MyFiles='sudo chown -R $(id -un):$(id -gn)'
alias Gods='sudo chown -R root:root'
alias noless='grep -Ev '\''^(#|$)'\'''
alias path='echo -e ${PATH//:/\\n}'
alias shutup='sudo shutdown -h now'
alias srch='sudo find / -mount -iname'
alias S='sudo'
[[ $(which youtube-dl 2>/dev/null) ]] && {
	alias ted='youtube-dl -q --console-title -o "%(title)s.%(ext)s" --write-sub --sub-lang "en,el"'
	alias you2me='youtube-dl -q --console-title -o "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 1'
}
alias tmount='mount | column -t'
alias wmesg='dmesg | grep -Ei "(error|warn|fail|taint|disa)"'
# -----------------------------------------------------------------------------]

# ---------------------------------------------------------------------[ Other ]
if [ ${VC:=0} -eq 0 ]; then
	if [ $EUID -ne 0 ]; then
		PS1='\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]\[\e[0m\]\[\e[0;36m\]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]'
	else
		PS1="\342\225\255\342\224\244\[\e[0;96m\]\u@\h \342\232\231 \w\[\e[0;0m\]\342\224\234\342\210\230\n\342\225\260\342\224\200\342\232\231 "
	fi
fi
# -----------------------------------------------------------------------------]

unset debians
