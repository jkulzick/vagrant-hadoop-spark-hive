#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

# https://docs.vagrantup.com/v2/provisioning/shell.html

source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"
	systemctl stop firewalld
	systemctl mask firewalld
	chkconfig firewalld off
}

function setupHosts {
	echo "modifying /etc/hosts file"
	echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" >> /etc/nhosts
	echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> /etc/nhosts
	cp /etc/nhosts /etc/hosts
	rm -f /etc/nhosts
}

function installSSHPass {
	yum -y install sshpass
}

function overwriteSSHCopyId {
	cp -f $RES_SSH_COPYID_MODIFIED /usr/bin/ssh-copy-id
}

function createSSHKey {
	echo "generating ssh key"
	yes y |ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	cp -f $RES_SSH_CONFIG ~/.ssh
}

function setupUtilities {
    # so the `locate` command works
    yum -y install mlocate
    updatedb

	yum -y install wget
	yum -y install vim
}

echo "setting up external yum cache"
cp /vagrant/resources/yumconf/yum.conf /etc/
cp /vagrant/resources/yumconf/MariaDB10.repo /etc/yum.repos.d/
yum -y update

echo "setup centos"
disableFirewall

echo "setup centos hosts file"
setupHosts

echo "setup ssh"
installSSHPass
createSSHKey
overwriteSSHCopyId

echo "setup utilities"
setupUtilities

echo "centos setup complete"

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x