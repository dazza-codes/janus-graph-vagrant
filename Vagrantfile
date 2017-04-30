# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VM_IP = "10.10.10.10"

# JanusGraph 0.1.0 compatibility:
# - Apache Cassandra 2.1.9
# - Apache HBase 0.98.8-hadoop2, 1.0.3, 1.1.8, 1.2.4
# - Google Cloud Bigtable 0.9.5.1
# - BerkeleyJE 7.3.7
# - Elasticsearch 1.5.1
# - Apache Lucene 4.10.4
# - Apache Solr 5.2.1
# - Apache TinkerPop 3.2.3
# - Java 1.8

CASS_VER = "21x"  # cassandra

ES_VER = "1.5.1"  # elasticsearch


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "janus-graph"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "janus-graph"
  end

  config.vm.network :private_network, ip: VM_IP

  # packages
  shared_dir = "/vagrant"
  default_args = [shared_dir, VM_IP, ]
  packages = {
    'scripts/bootstrap.sh' => default_args,
    'scripts/packages/vim.sh' => default_args,
    'scripts/packages/git.sh' => default_args,

    # java8 etc
    'scripts/packages/java.sh' => default_args,  # oracle java setup only
    'scripts/packages/java8.sh' => default_args, # oracle java 8
    'scripts/packages/maven.sh' => default_args,
    'scripts/packages/gradle.sh' => default_args,

    # Backend dependencies
    'scripts/packages/berkeleydb.sh' => default_args,
    'scripts/packages/elasticsearch.sh' => [shared_dir, VM_IP, ES_VER],
    'scripts/packages/cassandra.sh' => [shared_dir, VM_IP, CASS_VER],

    # JanusGraph distributed graph database
    # Formerly the TitanGraph project, now migrated to JanusGraph.
    # See https://github.com/JanusGraph/janusgraph/releases
    'scripts/packages/janus-graph.sh' => default_args,

    # TinkerPop3 compatible with JanusGraph
    'scripts/packages/tinkerpop3.sh' => default_args,

    'scripts/cleanup.sh' => default_args
  }

  packages.each_pair do |path, args|
    config.vm.provision "shell", path: path, args: args
  end

end

