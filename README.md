Linux - user startup scripts
============================

Debian/Ubuntu distros
---------------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors_256'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.nanorc'

```

Arch distros
------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/arch.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors_256'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.nanorc'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.yaourtrc'

```

Fedora distros
--------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile' -O .bash_profile
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors_256'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.nanorc'

```

OpenSUSE distros
----------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases' -O .alias
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors_256'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.nanorc'

```

Debian/Ubuntu distros (alter way)
---------------------------------
```bash
cd "${HOME}"
mkdir -pv "${HOME}"/gitDirs
cd "${HOME}"/gitDirs
git clone https://github.com/drxspace/dotfiles.git

ln -sfv "${HOME}"/gitDirs/dotfiles/deb.bashrc "${HOME}"/.bashrc
ln -sfv "${HOME}"/gitDirs/dotfiles/.bash_aliases "${HOME}"/.bash_aliases
ln -sfv "${HOME}"/gitDirs/dotfiles/.profile "${HOME}"/.profile
ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors "${HOME}"/.dircolors
ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors_256 "${HOME}"/.dircolors_256
ln -sfv "${HOME}"/gitDirs/dotfiles/.nanorc "${HOME}"/.nanorc

sudo -E sh -c '
	ln -sfv "${HOME}"/gitDirs/dotfiles/deb.bashrc /root/.bashrc
	ln -sfv "${HOME}"/gitDirs/dotfiles/.bash_aliases /root/.bash_aliases
	ln -sfv "${HOME}"/gitDirs/dotfiles/.profile /root/.profile
	ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors /root/.dircolors
	ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors_256 /root/.dircolors_256
	ln -sfv "${HOME}"/gitDirs/dotfiles/.nanorc /root/.nanorc
'

```

Arch distros (alter way)
------------------------
```bash
cd "${HOME}"
mkdir -pv "${HOME}"/gitDirs
cd "${HOME}"/gitDirs
git clone https://github.com/drxspace/dotfiles.git

ln -sfv "${HOME}"/gitDirs/dotfiles/arch.bashrc "${HOME}"/.bashrc
ln -sfv "${HOME}"/gitDirs/dotfiles/.bash_aliases "${HOME}"/.bash_aliases
ln -sfv "${HOME}"/gitDirs/dotfiles/.profile "${HOME}"/.profile
ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors "${HOME}"/.dircolors
ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors_256 "${HOME}"/.dircolors_256
ln -sfv "${HOME}"/gitDirs/dotfiles/.nanorc "${HOME}"/.nanorc
ln -sfv "${HOME}"/gitDirs/dotfiles/.yaourtrc "${HOME}"/.yaourtrc

sudo -E sh -c '
	ln -sfv "${HOME}"/gitDirs/dotfiles/arch.bashrc /root/.bashrc
	ln -sfv "${HOME}"/gitDirs/dotfiles/.bash_aliases /root/.bash_aliases
	ln -sfv "${HOME}"/gitDirs/dotfiles/.profile /root/.profile
	ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors /root/.dircolors
	ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors_256 /root/.dircolors_256
	ln -sfv "${HOME}"/gitDirs/dotfiles/.nanorc /root/.nanorc
	ln -sfv "${HOME}"/gitDirs/dotfiles/.yaourtrc /root/.yaourtrc
'

```

