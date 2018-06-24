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

        node.vm.provision "install", type: "shell", env: {"DEBUG_SPARK_VAGRANT" => "$DEBUG_SPARK_VAGRANT"} do |shell|
            path: "scripts/setup-centos.sh"
            path: "scripts/setup-mysql.sh"
            path: "scripts/setup-java.sh"
            path: "scripts/setup-python.sh"

            path: "scripts/setup-hadoop-1.sh"
            path: "scripts/setup-hadoop-2.sh"

            path: "scripts/setup-hive.sh"
            path: "scripts/setup-spark.sh"

            path: "scripts/finalize-centos.sh"
        end

        node.vm.provision "start", type: shell", run: "always", env: {"$DEBUG_SPARK_VAGRANT" => "$DEBUG_SPARK_VAGRANT"} do |shell|
            path: "scripts/start-hadoop.sh"
            path: "scripts/start-hive.sh"
            path: "scripts/start-spark.sh"
        end
    end
end
