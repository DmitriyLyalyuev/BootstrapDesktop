#!/bin/bash

# Add needed repositories
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gencfsm
sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"

cd /tmp
wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_12.04/Release.key
sudo apt-key add - < Release.key

# Install all software
sudo apt-get update
sudo apt-get install -y build-essential libcurl4-openssl-dev libmysqlclient-dev \
  libreadline-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev libmagickwand-dev \
  mc git git-core xbindkeys xsel diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot grc htop sublime-text oracle-java7-installer encfs openssh-server \
  keepassx libasound2-plugins:i386 sni-qt:i386 \
  pidgin-libnotify pidgin-plugin-pack pidgin-extprefs pidgin-otr \
  screen reptyr gnome-encfs-manager virtualbox owncloud-client wine \
  python-pip sshpass clementine libyaml-dev darktable python-dev apg \
  virtaulenv virtaulenvwrapper

# Ansible dependencies
sudo pip install paramiko PyYAML jinja2 httplib2

if [ ! -f ~/.desktopinstalled ]; then
  # Install ansible
  git clone https://github.com/ansible/ansible.git ~/.ansible

  # Install rbenv in $HOME/.rbenv
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  mkdir -p ~/Projects/Public
  mkdir -p ~/Projects/Private
  mkdir -p ~/Projects/Clients

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

sudo apt-get dist-upgrade

echo "Software for manual installation:"
echo "Slack: https://slack.com/apps"
echo "Skype: http://www.skype.com/uk/download-skype/skype-for-computer/"
