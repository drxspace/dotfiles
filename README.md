Linux - user startup scripts
============================

Debian/Ubuntu distros
---------------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

Arch distros
------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/arch.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

Fedora distros
--------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile' -O .bash_profile
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

OpenSUSE distros
----------------
```bash
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases' -O .alias
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q -N 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

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

sudo -E sh -c '
	ln -sfv "${HOME}"/gitDirs/dotfiles/deb.bashrc /root/.bashrc
	ln -sfv "${HOME}"/gitDirs/dotfiles/.bash_aliases /root/.bash_aliases
	ln -sfv "${HOME}"/gitDirs/dotfiles/.profile /root/.profile
	ln -sfv "${HOME}"/gitDirs/dotfiles/.dircolors /root/.dircolors
'

```
