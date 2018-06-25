Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

%x(vagrant plugin install vagrant-vbguest) unless Vagrant.has_plugin?('vagrant-vbguest')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "spark" do |node|

        node.vm.box = "centos/7"
        node.vm.synced_folder ".", "/vagrant", type: "virtualbox"

        node.vm.provider "virtualbox" do |v|
          v.name = "spark"
          v.memory = 8192
          v.cpus = 4
        end

        node.vm.network :private_network, ip: "10.211.55.101"
        node.vm.hostname = "10.211.55.101"

        node.vm.provision "install", type: "shell" do |install|
            install.env = {"DEBUG_SPARK_VAGRANT" => ENV['DEBUG_SPARK_VAGRANT']}
            install.inline = <<-SHELL
                /vagrant/scripts/setup-centos.sh

                /vagrant/scripts/setup-mysql.sh
                /vagrant/scripts/setup-java.sh
                /vagrant/scripts/setup-python.sh

                /vagrant/scripts/setup-hadoop-1.sh
                /vagrant/scripts/setup-hadoop-2.sh

                /vagrant/scripts/setup-hive.sh
                /vagrant/scripts/setup-spark.sh

                /vagrant/scripts/finalize-centos.sh
           SHELL
        end

        node.vm.provision "start", type: "shell", run: "always" do |start|
            start.env = {"DEBUG_SPARK_VAGRANT" => ENV['DEBUG_SPARK_VAGRANT']}
                start.inline = <<-SHELL
                /vagrant/scripts/start-hadoop.sh
                /vagrant/scripts/start-hive.sh
                /vagrant/scripts/start-spark.sh
            SHELL
        end
    end
end
