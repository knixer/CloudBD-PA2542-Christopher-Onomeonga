#!/bin/sh

sudo apt update
sudo apt -y install expect

MYSQL_PASSWORD="root"

SECURE_MYSQL=$(expect -c "

set timeout 3

spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"\r\"

expect \"Set root password? \[Y/n\]\"
send \"y\r\"

expect \"New password:\"
send \"$MYSQL_PASSWORD\r\"

expect \"Re-enter new password:\"
send \"$MYSQL_PASSWORD\r\"

expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No) :\"
send \"n\r\"

expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No) :\"
send \"n\r\"

expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No) :\"
send \"y\r\"

expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) :\"
send \"y\r\"



expect eof
")

echo "${SECURE_MYSQL}"


