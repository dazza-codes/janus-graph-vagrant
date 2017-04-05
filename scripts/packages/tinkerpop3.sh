#!/usr/bin/env bash

#export shared_path=$1
#export HOST_IP=$2

# Download and Unpack
if [ ! -d apache-tinkerpop-gremlin-server-3.2.4 ]; then
    echo "Installing TinkerPop Gremlin-Server"
    wget http://apache.mirrors.lucidnetworks.net/tinkerpop/3.2.4/apache-tinkerpop-gremlin-server-3.2.4-bin.zip
    unzip apache-tinkerpop-gremlin-server-3.2.4-bin.zip
fi

if [ ! -d apache-tinkerpop-gremlin-console-3.2.4 ]; then
    echo "Installing TinkerPop Gremlin-Console"
    wget http://apache.mirrors.lucidnetworks.net/tinkerpop/3.2.4/apache-tinkerpop-gremlin-console-3.2.4-bin.zip
    unzip apache-tinkerpop-gremlin-console-3.2.4-bin.zip
fi

if [ ! -d tinkerpop-3.2.4 ]; then
    echo "Installing TinkerPop Source"
    wget http://apache.mirrors.lucidnetworks.net/tinkerpop/3.2.4/apache-tinkerpop-3.2.4-src.zip
    unzip apache-tinkerpop-3.2.4-src.zip
fi

