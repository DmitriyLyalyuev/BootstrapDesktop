#!/bin/bash

# Add needed repositories
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gencfsm

# Install all software
sudo apt update
sudo apt install -y build-essential libcurl4-openssl-dev libmysqlclient-dev \
  libreadline-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev libmagickwand-dev \
  mc git git-core xbindkeys xsel diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot grc htop sublime-text oracle-java8-installer encfs openssh-server \
  keepassx pidgin-libnotify pidgin-plugin-pack pidgin-extprefs pidgin-otr \
  screen gnome-encfs-manager virtualbox python-pip sshpass clementine libyaml-dev python-dev apg \
  virtualenv virtualenvwrapper terminator acpi scrot mypaint zenity texlive-full \
  libyajl-dev

# Install docker
curl -sSL https://get.docker.com/ | sh

cd /tmp
wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
dpkg -i *.deb

# Ansible dependencies
sudo pip install paramiko PyYAML jinja2 httplib2 imgurpython

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
  ln -s ~/Projects/Public/DotFiles/.liquidpromptrc ~/.config/liquidpromptrc
  ln -s ~/Projects/Public/DotFiles/.grc ~/.grc
  sudo ln -s ~/Projects/Public/DotFiles/etc/grc.conf /etc/grc.conf

  touch ~/.desktopinstalled
fi

sudo apt-get dist-upgrade

echo "Software for manual installation:"
echo "Slack: https://slack.com/apps"
echo "Skype: http://www.skype.com/uk/download-skype/skype-for-computer/"
