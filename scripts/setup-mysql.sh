#!/bin/bash

yum -y install mariadb-server
systemctl start mariadb


cat << EOF | mysql -u root
	CREATE DATABASE metastore;
	USE metastore;
	CREATE USER 'hive'@'metastorehost' IDENTIFIED BY 'cake';
	REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'hive'@'metastorehost';
	FLUSH PRIVILEGES;
	GRANT ALL PRIVILEGES ON *.* TO 'hive'@'localhost' IDENTIFIED BY 'cake';
	FLUSH PRIVILEGES;
EOF