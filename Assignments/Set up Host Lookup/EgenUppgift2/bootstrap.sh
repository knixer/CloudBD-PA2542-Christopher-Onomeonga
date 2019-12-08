#!/bin/sh

command -v puppet > /dev/null && {echo "Puppet and prepairations for nodejs installed!; exit 0;}
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install curl