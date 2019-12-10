#!/bin/sh

sudo apt update
sudo apt -y install expect
sudo apt -y install mysql-server

MYSQL_PASSWORD="root"

SECURE_MYSQL=$(expect -c "

set timeout 3

spawn mysql_secure_installation

expect \"Press y|Y for Yes, any other key for No:\"
send \"n\r\"

expect \"New password:\"
send \"$MYSQL_PASSWORD\r\"

expect \"Re-enter new password:\"
send \"$MYSQL_PASSWORD\r\"

#expect \"Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) :\"
#send \"y\r\"

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

sudo mysql <<Queries
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
exit
Queries