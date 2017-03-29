#!/usr/bin/env bash

export shared_path=$1
export HOST_IP=$2
export CASS_VER=$3

[ -d /etc/cassandra ] && echo 'Skipping Cassandra' && exit


echo "Installing Cassandra"
sudo tee /etc/apt/sources.list.d/cassandra.sources.list <<_EOF_
deb http://www.apache.org/dist/cassandra/debian $CASS_VER main
deb-src http://www.apache.org/dist/cassandra/debian $CASS_VER main
_EOF_

# add apache cassandra keys
gpg_add_key () {
  server=$1
  key=$2
  gpg --keyserver $server --recv-keys $key
  gpg --export --armor $key | sudo apt-key add -
}

gpg_add_key keyserver.ubuntu.com 4BD736A82B5C1B00
gpg_add_key keyserver.ubuntu.com 749D6EEC0353B12C
gpg_add_key keyserver.ubuntu.com F758CE318D77295D
gpg_add_key pgp.mit.edu 749D6EEC0353B12C

# update repository
sudo apt-get update

# install
sudo apt-get install -y cassandra

# set listen host
sudo sed --in-place "s/localhost/$HOST_IP/g" /etc/cassandra/cassandra.yaml
sudo sed --in-place "s/127.0.0.1/$HOST_IP/g" /etc/cassandra/cassandra.yaml

# More sane default configurations - the default 50% free memory allocation is too much for me
sudo tee -a /etc/default/cassandra <<"_EOF_"

# Set the Max Memory used by Cassandra, change to whatever value you like
MAX_HEAP_SIZE="700M"
HEAP_NEWSIZE="200M"

# Performance Tuning
# see also : http://wiki.apache.org/cassandra/PerformanceTuning
JVM_OPTS="$JVM_OPTS -XX:+UseThreadPriorities" # To lower compaction priority
JVM_OPTS="$JVM_OPTS -XX:ThreadPriorityPolicy=42" # To lower compaction priority
JVM_OPTS="$JVM_OPTS -Dcassandra.compaction.priority=1" # To lower compaction priority
JVM_OPTS="$JVM_OPTS -XX:+UseCompressedOops" # enables compressed references, reducing memory overhead on 64bit JVMs

_EOF_


# restart Cassandra
sudo service cassandra restart


