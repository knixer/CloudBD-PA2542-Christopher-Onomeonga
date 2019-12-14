#!/bin/sh
centralServer="proxyserver"
ipDist="$(ifconfig eth1 | grep inet | awk '{ print $2 }'| head -1) $centralServer"
echo $ipDist | sudo tee -a /vagrant/proxyGetIP