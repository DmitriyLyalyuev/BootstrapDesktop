#!/bin/bash

# Add needed repositories
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gencfsm

# Install all software
sudo apt update
sudo apt install -y build-essential libcurl4-openssl-dev libmysqlclient-dev python-minimal \
  libreadline-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev libmagickwand-dev \
  mc git git-core tig xbindkeys xsel diffuse curl xclip grc htop sublime-text oracle-java8-installer \
  encfs openssh-server keepassx screen gnome-encfs-manager python-pip sshpass clementine libyaml-dev python-dev apg \
  virtualenv virtualenvwrapper terminator acpi zenity texlive-full libyajl-dev

# Install docker
curl -sSL https://get.docker.com/ | sh

cd /tmp
wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
wget http://dl.joxi.ru/linux/joxi-amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i *.deb

# Ansible dependencies
sudo pip install paramiko PyYAML jinja2 httplib2 imgurpython

if [ ! -f ~/.ansible ]; then
  # Install ansible
  git clone https://github.com/ansible/ansible.git ~/.ansible
fi

if [ ! -f ~/.rbenv ]; then
  # Install rbenv in $HOME/.rbenv
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

mkdir -p ~/Projects/Public
mkdir -p ~/Projects/Private
mkdir -p ~/Projects/Clients

if [ ! -f ~/Projects/Public/DotFiles ]; then
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
  ln -s ~/Projects/Public/DotFiles/.bash_completion ~/.bash_completion
  ln -s ~/Projects/Public/DotFiles/.bashrc ~/.bashrc
  ln -s ~/Projects/Public/DotFiles/.gemrc ~/.gemrc
  ln -s ~/Projects/Public/DotFiles/.gitconfig ~/.gitconfig
  ln -s ~/Projects/Public/DotFiles/.proxy_pac ~/.proxy_pac
  ln -s ~/Projects/Public/DotFiles/.vimrc ~/.vimrc
  ln -s ~/Projects/Public/DotFiles/.xbindkeysrc ~/.xbindkeysrc
  ln -s ~/Projects/Public/DotFiles/.liquidpromptrc ~/.config/liquidpromptrc
  ln -s ~/Projects/Public/DotFiles/.grc ~/.grc
  sudo ln -s ~/Projects/Public/DotFiles/etc/grc.conf /etc/grc.conf
fi

sudo apt-get dist-upgrade

# Disable hog process tracker-miner-fs
echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
tracker reset --hard
