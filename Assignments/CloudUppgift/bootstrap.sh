#!/bin/bash

sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo apt-get --yes install puppet

#KOMMENTARER, DETTA VAR FÖR WSL, som inte gick så bra...
#wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
#sudo dpkg -i vagrant_2.2.5_x86_64.deb
#cd /vagrant
#export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
#export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Users/Christopher/Desktop/Cloud Computing/CloudUppgift"