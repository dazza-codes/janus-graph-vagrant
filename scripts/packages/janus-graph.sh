#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2

janus_ver="janusgraph-0.1.0-SNAPSHOT-hadoop2"

[ -d $janus_ver ] && echo "Skipping JanusGraph" && exit

# Download and Unpack janusgraph-0.1.0-SNAPSHOT-hadoop2
echo "Installing JanusGraph"
wget https://github.com/JanusGraph/janusgraph/releases/download/0.1.0-SNAPSHOT-2017-03-18/janusgraph-dist-0.1.0-20170319.135512-2.zip > /dev/null
unzip janusgraph-dist-0.1.0-20170319.135512-2.zip

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

