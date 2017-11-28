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
  virtualenv virtualenvwrapper terminator acpi zenity texlive-full libyajl-dev libinput-tools xdotool \
  cvs clipit gitk

# Install docker
curl -sSL https://get.docker.com/ | sh

cd /tmp
wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
wget http://dl.joxi.ru/linux/joxi-amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i *.deb
sudo apt install -f

# Ansible dependencies
sudo pip install --upgrade pip
sudo easy_install -U setuptools
sudo pip install paramiko PyYAML jinja2 httplib2 imgurpython python-zenity awscli google.cloud

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
mkdir -p ~/.config/sublime-text-3/Packages/User


if [ ! -d ~/Projects/Public/DotFiles ]; then
  # Clone and install DotFiles
  git clone git@github.com:DmitriyLyalyuev/DotFiles.git ~/Projects/Public/DotFiles
  git clone https://github.com/wbond/package_control ~/.config/sublime-text-3/Packages/Package\ Control
  git clone git@github.com:DmitriyLyalyuev/SublimeText3Snippets.git ~/Projects/Public/SublimeText3Snippets
  git clone https://github.com/kemayo/sublime-text-git ~/.config/sublime-text-3/Packages/Git
  git clone https://github.com/JulianEberius/SublimePythonIDE.git ~/.config/sublime-text-3/Packages/PythonIDE
  git clone https://github.com/alexlouden/Terraform.tmLanguage.git ~/.config/sublime-text-3/Packages/Terraform
  git clone https://github.com/brandonwamboldt/sublime-nginx.git ~/.config/sublime-text-3/Packages/Nginx
  git clone https://github.com/titoBouzout/SideBarEnhancements.git ~/.config/sublime-text-3/Packages/SideBarEnhancements
  git clone https://github.com/SublimeLinter/SublimeLinter3.git ~/.config/sublime-text-3/Packages/SublimeLinter
  git clone https://github.com/jisaacks/GitGutter.git ~/.config/sublime-text-3/Packages/GitGutter
  git clone https://github.com/dzhibas/SublimePrettyJson.git ~/.config/sublime-text-3/Packages/PrettyJSON
  git clone https://github.com/wilon/Theme-MonokaiPlus ~/.config/sublime-text-3/Packages/Theme-Monokai+
  git clone https://github.com/revolunet/sublimetext-markdown-preview ~/.config/sublime-text-3/Packages/MarkDown\ Preview
  git clone https://github.com/SublimeCodeIntel/SublimeCodeIntel.git ~/.config/sublime-text-3/Packages/CodeIntel

  ln -s ~/Projects/Public/SublimeText3Snippets ~/.config/sublime-text-3/Packages/SublimeText3Snippets
  ln -s ~/Dropbox/Sublime/Settings/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
  ln -s ~/Dropbox/Sublime/Settings/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

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
  ln -s ~/Projects/Public/DotFiles/.grc ~/.grc
  ln -s ~/Projects/Public/DotFiles/libinput-gestures.conf ~/.config/libinput-gestures.conf
  sudo ln -s ~/Projects/Public/DotFiles/etc/grc.conf /etc/grc.conf

  cd /tmp
  git clone http://github.com/bulletmark/libinput-gestures
  cd libinput-gestures
  sudo make install
  sudo gpasswd -a $USER input
  sudo ./libinput-gestures-setup install
  libinput-gestures-setup start
fi

sudo apt-get dist-upgrade

echo "!!! You need to reboot ypur laptop !!!"

# Disable hog process tracker-miner-fs
#echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null
#gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
#gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
#tracker reset --hard
