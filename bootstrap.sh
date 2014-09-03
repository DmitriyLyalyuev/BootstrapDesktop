#!/bin/bash

# Add needed repositories
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gencfsm

# Install all software
sudo apt-get update
sudo apt-get install -y build-essential libcurl4-openssl-dev libmysqlclient-dev \
  libreadline-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev libmagickwand-dev \
  mc git git-core xbindkeys xsel gitg diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot grc htop sublime-text oracle-java7-installer encfs jxplorer openssh-server \
  nautilus-dropbox keepassx libasound2-plugins:i386 sni-qt:i386 \
  pidgin-libnotify pidgin-plugin-pack pidgin-extprefs pidgin-otr \
  screen reptyr gnome-encfs-manager virtualbox owncloud-client wine

if [ ! -f ~/.desktopinstalled ]; then

# Install rbenv in $HOME/.rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ansible
git clone https://github.com/ansible/ansible.git ~/.ansible

# Clone and install DotFiles
git clone git@github.com:DmitriyLyalyuev/DotFiles.git ~/Projects/Public/DotFiles
rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.gemrc
rm -f ~/.gitconfig
rm -f ~/.proxy_pac
rm -f ~/.vimrc
rm -f ~/.xbindkeysrc
sudo rm -f /etc/grc.conf
ln -s ~/Projects/Public/DotFiles/.bash_aliases ~/.bash_aliases
ln -s ~/Projects/Public/DotFiles/.bashrc ~/.bashrc
ln -s ~/Projects/Public/DotFiles/.gemrc ~/.gemrc
ln -s ~/Projects/Public/DotFiles/.gitconfig ~/.gitconfig
ln -s ~/Projects/Public/DotFiles/.proxy_pac ~/.proxy_pac
ln -s ~/Projects/Public/DotFiles/.vimrc ~/.vimrc
ln -s ~/Projects/Public/DotFiles/.xbindkeysrc ~/.xbindkeysrc
ln -s ~/Projects/Public/DotFiles/.grc ~/.grc
sudo ln -s ~/Projects/Public/DotFiles/etc/grc.conf /etc/grc.conf

touch ~/.desktopinstalled
fi
