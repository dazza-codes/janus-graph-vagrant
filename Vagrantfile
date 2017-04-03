# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VM_IP = "10.10.10.10"
CASS_VER = "21x"
ES_VER = "1.5.2"

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
    'scripts/packages/java.sh' => default_args,
    'scripts/packages/java8.sh' => default_args,
    'scripts/packages/maven.sh' => default_args,
    'scripts/packages/gradle.sh' => default_args,

    # Backend dependencies
    'scripts/packages/berkeleydb.sh' => default_args,
    'scripts/packages/elasticsearch.sh' => [shared_dir, VM_IP, ES_VER],
    'scripts/packages/cassandra.sh' => [shared_dir, VM_IP, CASS_VER],

    # The TitanGraph project has been taken up by JanusGraph.
    # See https://github.com/JanusGraph/janusgraph/releases
    'scripts/packages/janus-graph.sh' => default_args,

    'scripts/cleanup.sh' => default_args
  }

  packages.keys do |p|
    args = packages[p].join(' ')
    config.vm.provision "shell", path: p, args: args
  end

end

