# -----------------------------------------------------------------[ functions ]
chkpkgver () {
	local pkgver=$(dpkg -s $1 2>/dev/null)
	if grep -q "Version" <<< ${pkgver}; then
		sed -n 's/^.*Version: \([^ ]*\) .*/\1/p' <<< ${pkgver}
	else
		echo "package '$1' is not installed and no information is available"
	fi
}
# ------------------------------------------------------------------------[ ls ]
alias dl='ls -d {.*,*}/ -1'
alias d='ls -d */ -1'
alias lf='ls -1Ap | grep -v /$'
alias ll='ls -AlhF --group-directories-first'
# -----------------------------------------------------------------------[ apt ]
alias aptins='apt-get install'
alias aptprg='apt-get autoremove --purge'
alias aptrns='apt-get install --reinstall'
alias aptver='chkpkgver'
alias upall='updt -q ; aptclr ; orphclr'
# ----------------------------------------------------------------[ Networking ]
alias netlst='netstat -tulpn | grep LISTEN'
alias ports='netstat -tulpn'
# ----------------------------------------------------------------------[ Misc ]
alias clean='bleachbit --preset --clean | grep -v "^[debug|info]"'
alias logoff='gnome-session-quit'
alias OnlyMe='find . -exec chmod go-rwx {} \;'
alias rm='rm -i'
alias shutup='shutdown -h now'
alias tmount='mount | column -t'
# ---------------------------------------------------------------------[ Other ]
PS1='\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]\[\e[0m\]\[\e[0;36m\]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]'
#PS1="\342\225\255\342\224\244\[\e[0;96m\]\u@\h \342\232\231 \w\[\e[0;0m\]\342\224\234\342\210\230\n\342\225\260\342\224\200\342\232\231 "
