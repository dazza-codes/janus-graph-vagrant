#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2

janus_ver="janusgraph-0.1.0-hadoop2"

[ -d $janus_ver ] && echo "Skipping JanusGraph" && exit

# Download and Unpack janusgraph-0.1.0-SNAPSHOT-hadoop2
echo "Installing JanusGraph"
wget https://github.com/JanusGraph/janusgraph/releases/download/v0.1.0/janusgraph-0.1.0-hadoop2.zip
unzip janusgraph-0.1.0-hadoop2.zip

# Clear existing conf file
pushd $janus_ver
mv ./conf/janusgraph-cassandra-es.properties ./conf/janusgraph-cassandra-es.properties.bak

# Set conf file
sudo tee -a ./conf/janusgraph-cassandra-es.properties <<_EOF_
storage.backend=cassandrathrift
storage.hostname=$HOST_IP
cache.db-cache = false
index.search.backend=elasticsearch
index.search.hostname=$HOST_IP
index.search.elasticsearch.client-only=true
_EOF_

popd

