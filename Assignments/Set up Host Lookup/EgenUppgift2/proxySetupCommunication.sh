#!/bin/sh
cat /vagrant/proxyGetIP | sudo tee -a /etc/hosts
sudo apt -y install expect

USER="vagrant"
PASSWD="root"
SET_USER_PASSWORD=$(expect -c "

set timeout 3

spawn sudo passwd $USER
expect \"Enter new UNIX password: \"
send \"$PASSWD\r\"

expect \"Retype new UNIX password: \"
send \"$PASSWD\r\"

expect eof
")

echo "${SET_USER_PASSWORD}"