###
# BASICS
###

cd

# Update
apt-get clean
apt-get -y -qq update
apt-get -y upgrade
apt-get clean

# SSH
apt-get -y install openssh-server

# Build tools
apt-get -y install debian-keyring debian-archive-keyring
apt-get -y install build-essential
apt-get -y install libreadline-dev
apt-get -y install libyaml-dev
apt-get -y install libqtwebkit-dev
apt-get -y install libssl-dev
apt-get -y install libsqlite3-dev
apt-get -y install zlib1g-dev

# wget and curl
apt-get -y install wget curl

# More helpful packages
apt-get -y install htop tree zsh fish
apt-get -y install fonts-inconsolata

