#!/bin/bash

sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update
sudo apt-get install -y mc git git-core xbindkeys xsel gitg diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot mpd mpc sonata rsnapshot lxc grc htop \
  sublime-text oracle-java7-installer encfs jxplorer openssh-server \
  nautilus-dropbox keepassx

if [ "`dpkg -l skype | grep ii | cut '-d ' -f1`" != "ii" ]; then
    wget -O skype.deb http://www.skype.com/go/getskype-linux-beta-ubuntu-64
    sudo dpkg -i ./skype.deb
    rm -f ./skype.deb
fi
