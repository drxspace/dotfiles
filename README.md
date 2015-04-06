Linux - user startup scripts
============================

Debian/Ubuntu distros
---------------------
```bash
wget -q 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

Arch distros
------------
```bash
wget -q 'https://raw.github.com/drxspace/dotfiles/master/arch.bashrc' -O .bashrc
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

Fedora distros
--------------
```bash
wget -q 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.profile' -O .bash_profile
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

OpenSUSE distros
----------------
```bash
wget -q 'https://raw.github.com/drxspace/dotfiles/master/deb.bashrc' -O .bashrc
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.bash_aliases' -O .alias
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.profile'
wget -q 'https://raw.github.com/drxspace/dotfiles/master/.dircolors'

```

Debian/Ubuntu distros (alter way)
---------------------------------
```bash
cd $HOME
mkdir -pv $HOME/gitdirs
________________________________________________________________________________

cd $HOME/gitdirs
git clone https://github.com/drxspace/nautilus-scripts.git

ln -sv $HOME/gitdirs/nautilus-scripts/1253utf-8 $HOME/.local/share/nautilus/scripts/1253utf-8
ln -sv $HOME/gitdirs/nautilus-scripts/minScript $HOME/.local/share/nautilus/scripts/minScript
ln -sv $HOME/gitdirs/nautilus-scripts/OpenAsRoot $HOME/.local/share/nautilus/scripts/OpenAsRoot
ln -sv $HOME/gitdirs/nautilus-scripts/TerminalHere $HOME/.local/share/nautilus/scripts/TerminalHere
ln -sv $HOME/gitdirs/nautilus-scripts/TerminatorHere $HOME/.local/share/nautilus/scripts/TerminatorHere

chmod 775 $HOME/.local/share/nautilus/scripts/*
________________________________________________________________________________

cd $HOME/gitdirs
git clone https://github.com/drxspace/dotfiles.git

ln -sfv $HOME/gitdirs/dotfiles/deb.bashrc $HOME/.bashrc
ln -sfv $HOME/gitdirs/dotfiles/.bash_aliases $HOME/.bash_aliases
ln -sfv $HOME/gitdirs/dotfiles/.profile $HOME/.profile
ln -sfv $HOME/gitdirs/dotfiles/.dircolors $HOME/.dircolors

sudo sh -c '
ln -sfv $HOME/gitdirs/dotfiles/deb.bashrc /root/.bashrc
ln -sfv $HOME/gitdirs/dotfiles/.bash_aliases /root/.bash_aliases
ln -sfv $HOME/gitdirs/dotfiles/.profile /root/.profile
ln -sfv $HOME/gitdirs/dotfiles/.dircolors /root/.dircolors
'
```
