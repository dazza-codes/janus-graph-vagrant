#!/usr/bin/env bash

#export shared_path=$1
#export HOST_IP=$2

# JanusGraph 0.1 compatibility is 3.2.3, hopefully 3.2.4 is OK because 3.2.3 does not download
TP_VER="3.2.4"

# Download and Unpack
if [ ! -d apache-tinkerpop-gremlin-server-${TP_VER} ]; then
    echo "Installing TinkerPop Gremlin-Server"
    wget -q http://apache.mirrors.lucidnetworks.net/tinkerpop/${TP_VER}/apache-tinkerpop-gremlin-server-${TP_VER}-bin.zip
    unzip -q apache-tinkerpop-gremlin-server-${TP_VER}-bin.zip
fi

if [ ! -d apache-tinkerpop-gremlin-console-${TP_VER} ]; then
    echo "Installing TinkerPop Gremlin-Console"
    wget -q http://apache.mirrors.lucidnetworks.net/tinkerpop/${TP_VER}/apache-tinkerpop-gremlin-console-${TP_VER}-bin.zip
    unzip -q apache-tinkerpop-gremlin-console-${TP_VER}-bin.zip
fi

if [ ! -d tinkerpop-${TP_VER} ]; then
    echo "Installing TinkerPop Source"
    wget -q http://apache.mirrors.lucidnetworks.net/tinkerpop/${TP_VER}/apache-tinkerpop-${TP_VER}-src.zip
    unzip -q apache-tinkerpop-${TP_VER}-src.zip
fi


exit


# Older versions

wget -q https://archive.apache.org/dist/incubator/tinkerpop/3.0.2-incubating/apache-gremlin-console-3.0.2-incubating-bin.zip
wget -q https://archive.apache.org/dist/incubator/tinkerpop/3.0.2-incubating/apache-gremlin-server-3.0.2-incubating-bin.zip
wget -q https://archive.apache.org/dist/incubator/tinkerpop/3.0.2-incubating/apache-tinkerpop-3.0.2-incubating-src.zip

wget -q http://apache.mirrors.lucidnetworks.net/tinkerpop/3.1.6/apache-tinkerpop-gremlin-console-3.1.6-bin.zip
wget -q http://mirror.cogentco.com/pub/apache/tinkerpop/3.1.6/apache-tinkerpop-gremlin-server-3.1.6-bin.zip
wget -q http://supergsego.com/apache/tinkerpop/3.1.6/apache-tinkerpop-3.1.6-src.zip

