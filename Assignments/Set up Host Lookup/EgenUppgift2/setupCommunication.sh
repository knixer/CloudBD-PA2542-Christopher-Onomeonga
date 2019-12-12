#!/bin/sh
cat /vagrant/ipHosts.txt | sudo tee -a /etc/hosts
sudo apt -y install expect

PASSWD="root"
SET_USER_PASSWORD=$(expect -c "

set timeout 3

spawn sudo passwd
expect \"Enter new UNIX password: \"
send \"$PASSWD\r\"

expect \"Retype new UNIX password: \"
send \"$PASSWD\r\"

expect eof
")

echo "${SET_USER_PASSWORD}"