Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

%x(vagrant plugin install vagrant-vbguest) unless Vagrant.has_plugin?('vagrant-vbguest')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    i = 1
    config.vm.define "node#{i}" do |node|

        node.vm.box = "centos/7"
        node.vm.synced_folder ".", "/vagrant", type: "virtualbox"

        node.vm.provider "virtualbox" do |v|
          v.name = "node#{i}"
          v.memory = 8192
          v.cpus = 4
        end
        node.vm.network :private_network, ip: "10.211.55.101"
        node.vm.hostname = "10.211.55.101"
        node.vm.provision "shell", path: "scripts/setup-centos.sh"
        node.vm.provision "shell", path: "scripts/setup-mysql.sh"
        node.vm.provision "shell", path: "scripts/setup-java.sh"
        node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        node.vm.provision "shell", path: "scripts/setup-hive.sh"
        node.vm.provision "shell", path: "scripts/setup-spark.sh"
        node.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
end
