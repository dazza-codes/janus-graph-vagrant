# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

VM_IP = "10.10.10.10"
CASS_VER = "21x"
ES_VER = "1.5.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "titan"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "titan"
  end

  config.vm.network :private_network, ip: VM_IP

  # packages
  shared_dir = "/vagrant"
  default_args = [shared_dir, VM_IP, ]
  packages = {
    'scripts/bootstrap.sh' => default_args,
    'scripts/packages/vim.sh' => default_args,
    'scripts/packages/git.sh' => default_args,
    'scripts/packages/java.sh' => default_args,
    'scripts/packages/java8.sh' => default_args,
    'scripts/packages/maven.sh' => default_args,
    'scripts/packages/gradle.sh' => default_args,

    # As of March 2017, the recommended version of titan is titan-1.0.0-hadoop1
    # See https://github.com/thinkaurelius/titan/wiki/Downloads (last updated Feb 4, 2016)
    'scripts/packages/titan-1.0.0-hadoop1.sh' => default_args,

    'scripts/packages/elasticsearch.sh' => [shared_dir, VM_IP, ES_VER],
    'scripts/packages/cassandra.sh' => [shared_dir, VM_IP, CASS_VER],

    'scripts/cleanup.sh' => default_args
  }

  packages.keys do |p|
    args = packages[p].join(' ')
    config.vm.provision "shell", path: p, args: args
  end

end

