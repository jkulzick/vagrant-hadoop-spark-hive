#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

function installMySql {
	echo "install mariadb"

	yum -y install MariaDB-server MariaDB-client
	systemctl start mariadb
	systemctl enable mariadb
	mysql_upgrade

}

function setupUsers {
	echo "setup users"

	cat <<-EOF | mysql -u root
		CREATE DATABASE IF NOT EXISTS metastore;
		USE metastore;
		CREATE USER IF NOT EXISTS 'hive'@'metastorehost' IDENTIFIED BY 'cake';
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

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x