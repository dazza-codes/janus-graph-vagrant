#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2

titan_ver="titan-1.0.0-hadoop2"

[ -d $titan_ver ] && echo 'Skipping Titan' && exit

echo "Installing Titan"
wget https://s3.amazonaws.com/s3.thinkaurelius.com/downloads/titan/${titan_ver}.zip > /dev/null
unzip ${titan_ver}.zip

# Clear existing conf file
echo "" > titan-*/conf/titan-cassandra-es.properties 

# Set conf file
sudo tee -a titan-*/conf/titan-cassandra-es.properties <<_EOF_
storage.backend=cassandrathrift
storage.hostname=$HOST_IP
cache.db-cache = false
index.search.backend=elasticsearch
index.search.hostname=$HOST_IP
index.search.elasticsearch.client-only=true
_EOF_


