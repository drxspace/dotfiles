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
#DISTRO=$(cat /etc/*release 2>/dev/null | awk -F= '/^ID=/ { thisdistro=$2; } /^ID_.*=/ { thisdistro=$2; } END { print tolower(thisdistro) }')
DISTRO=$(cat /etc/*release 2>/dev/null | awk -F= '/^ID=/ { thisdistro=$2; } END { print tolower(thisdistro) }')
# -----------------------------------------------------------------------------]

if [[ "${DISTRO}" == "ubuntu" ]] || [[ "${DISTRO}" == "debian" ]]; then
	getpkgver () {
		local pkgver=$(dpkg -s $1 2>/dev/null)
		if grep -q "Version" <<< ${pkgver}; then
			sed -n 's/^.*Version: \([^ ]*\) .*/\1/p' <<< ${pkgver}
		else
			echo "package '$1' is not installed and no information is available"
		fi
	}
	alias isins='getpkgver'
fi

if [[ $EUID -eq 0 ]]; then
	if [[ "${DISTRO}" == "ubuntu" ]] || [[ "${DISTRO}" == "debian" ]]; then
		# -------------------------------------------------------[ apt ]
		alias aptins='apt-get install'
		alias aptprg='apt-get autoremove --purge'
		alias aptrns='apt-get install --reinstall'
		alias upall='updt -q ; aptclr ; orphclr'
		# -------------------------------------------------------------]
	elif [[ "${DISTRO}" == "opensuse" ]]; then
		# ----------------------------------------------------[ zypper ]
		alias zcl='zypper cc -a'
		alias zdup='zypper dup'
		alias zref='zypper ref'
		alias zup='zypper up'
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
alias ga='git add'
alias gb='git branch -a'
alias gc='git checkout'
alias gcm='git commit -am'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias gull='git pull'
alias gush='git push'
# -----------------------------------------------------------------------------]

# ----------------------------------------------------------------------[ Misc ]
alias ..='cd ..'
alias ...='cd ../..'
alias clean='bleachbit --preset --clean | grep -v "^[debug|info]"'
[[ $(which colordiff 2>/dev/null) ]] && alias diff='colordiff'
alias distro='echo ${DISTRO}'
alias ka='killall'
alias logoff='gnome-session-quit'
alias MyDirs='sudo chown -R $(id -un):$(id -gn)'
alias noless='grep -Ev '\''^(#|$)'\'''
alias path='echo -e ${PATH//:/\\n}'
alias shutup='sudo shutdown -h now'
alias srch='sudo find / -mount -iname'
alias S='sudo'
alias tmount='mount | column -t'
alias wmesg='dmesg | grep -Ei "(error|warning)"'
alias you2me='youtube-dl -o "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 1'
# -----------------------------------------------------------------------------]

# ---------------------------------------------------------------------[ Other ]
if [[ ${VC:=0} -eq 0 ]]; then
	if [[ $EUID -ne 0 ]]; then
		PS1='\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]\[\e[0m\]\[\e[0;36m\]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]'
	else
		PS1="\342\225\255\342\224\244\[\e[0;96m\]\u@\h \342\232\231 \w\[\e[0;0m\]\342\224\234\342\210\230\n\342\225\260\342\224\200\342\232\231 "
	fi
fi
# -----------------------------------------------------------------------------]

