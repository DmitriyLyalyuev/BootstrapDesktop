#!/bin/bash

sudo add-apt-repository -y ppa:a-v-shkop/chromium-dev
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
wget -O - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.insynchq.com/ubuntu $(lsb_release -sc) non-free" >> /etc/apt/sources.list.d/insync.list'

sudo apt-get update
sudo apt-get install -y mc git git-core xbindkeys xsel gitg diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot mpd mpc sonata rsnapshot nautilus-dropbox lxc grc htop \
  chromium-browser sublime-text-dev oracle-java7-installer insync-beta-ubuntu \
  encfs jxplorer openssh-server

if [ "`dpkg -l skype | grep ii | cut '-d ' -f1`" != "ii" ]; then
    wget -O skype.deb http://www.skype.com/go/getskype-linux-beta-ubuntu-64
    sudo dpkg -i ./skype.deb
    rm -f ./skype.deb
fi
