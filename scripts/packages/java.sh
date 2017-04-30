#!/bin/sh

echo "Common Oracle java installation"
apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update -qq
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true   | /usr/bin/debconf-set-selections

