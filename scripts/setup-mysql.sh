#!/bin/bash

function installMySql {
	echo "install mariadb"

	yum -y install mariadb-server
	systemctl start mariadb
	systemctl enable mariadb

}

function setupUsers {
	echo "setup users"

	cat <<-EOF | mysql -u root
		CREATE DATABASE metastore;
		USE metastore;
		CREATE USER 'hive'@'metastorehost' IDENTIFIED BY 'cake';
		REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'hive'@'metastorehost';
		FLUSH PRIVILEGES;
		GRANT ALL PRIVILEGES ON *.* TO 'hive'@'localhost' IDENTIFIED BY 'cake';
		FLUSH PRIVILEGES;
	EOF
}

echo "setup mysql"

installMySql
setupUsers

echo "mysql setup complete"