#!/bin/bash

sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update
sudo apt-get install -y mc git git-core xbindkeys xsel gitg diffuse hamster-indicator hamster-applet hotot curl \
  xclip scrot grc htop \
  sublime-text oracle-java7-installer encfs jxplorer openssh-server \
  nautilus-dropbox keepassx libasound2-plugins:i386 sni-qt:i386

sudo add-apt-repository ppa:gencfsm && sudo apt-get update && sudo apt-get -y install gnome-encfs-manager
