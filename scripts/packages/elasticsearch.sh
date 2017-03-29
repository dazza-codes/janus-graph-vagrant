#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2
export ES_VER=$3

[ -d /etc/elasticsearch ] && echo 'Skipping Elasticsearch' && exit

echo "Installing Elasticsearch"
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ES_VER}.deb > /dev/null
sudo dpkg -i elasticsearch-*.deb

# set listen host
echo "Setting elasticsearch host to $HOST_IP"
sudo rm /etc/elasticsearch/elasticsearch.yml
echo "network.host: $HOST_IP" | sudo tee /etc/elasticsearch/elasticsearch.yml > /dev/null

# Install the head plugin
sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head

sudo service elasticsearch restart

