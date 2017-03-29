#!/bin/sh

# This script depends on the ./java.sh for installation of Oracle java dependencies

echo "java 7 installation"
apt-get install -y oracle-java7-installer
yes "" | apt-get -f install
