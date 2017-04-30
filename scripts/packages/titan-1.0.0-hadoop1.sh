#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2

titan_ver="titan-1.0.0-hadoop1"

[ -d $titan_ver ] && echo "Skipping Titan: ${titan_ver}" && exit

echo "Installing Titan: ${titan_ver}"
wget https://s3.amazonaws.com/s3.thinkaurelius.com/downloads/titan/${titan_ver}.zip > /dev/null
unzip ${titan_ver}.zip

# Clear existing conf file
echo "" > ${titan_ver}/conf/titan-cassandra-es.properties 

# Set conf file
sudo tee -a ${titan_ver}/conf/titan-cassandra-es.properties <<_EOF_
storage.backend=cassandrathrift
storage.hostname=$HOST_IP
cache.db-cache = false
index.search.backend=elasticsearch
index.search.hostname=$HOST_IP
index.search.elasticsearch.client-only=true
_EOF_


