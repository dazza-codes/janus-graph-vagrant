#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2

janus_ver="janusgraph-0.1.0-hadoop2"

# Tested Compatibility
# 
#     Apache Cassandra 2.1.9
#     Apache HBase 0.98.8-hadoop2, 1.0.3, 1.1.8, 1.2.4
#     Google Cloud Bigtable 0.9.5.1
#     BerkeleyJE 7.3.7
#     Elasticsearch 1.5.1
#     Apache Lucene 4.10.4
#     Apache Solr 5.2.1
#     Apache TinkerPop 3.2.3
#     Java 1.8

[ -d $janus_ver ] && echo "Skipping JanusGraph" && exit

# Download and Unpack janusgraph-0.1.0-SNAPSHOT-hadoop2
echo "Installing JanusGraph"
wget -q https://github.com/JanusGraph/janusgraph/releases/download/v0.1.0/janusgraph-0.1.0-hadoop2.zip
unzip -q janusgraph-0.1.0-hadoop2.zip

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

