#!/bin/bash

# http://www.cloudera.com/content/cloudera/en/documentation/cdh4/v4-2-0/CDH4-Installation-Guide/cdh4ig_topic_18_4.html

source "/vagrant/scripts/common.sh"

function installLocalHive {
	echo "install hive from local file"
	FILE=/vagrant/resources/$HIVE_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteHive {
	echo "install hive from remote file"
	curl -sS -o /vagrant/resources/$HIVE_ARCHIVE -O -L $HIVE_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$HIVE_ARCHIVE -C /usr/local
}

function installHive {
	if resourceExists $HIVE_ARCHIVE; then
		installLocalHive
	else
		installRemoteHive
	fi
	ln -s /usr/local/apache-$HIVE_VERSION-bin /usr/local/hive
	mkdir /usr/local/hive/logs /usr/local/hive/derby/
}

function setupHive {
	echo "copying over hive configuration file"
	cp -f $HIVE_RES_DIR/* $HIVE_CONF
}

function setupEnvVars {
	echo "creating hive environment variables"
	cp -f $HIVE_RES_DIR/hive.sh /etc/profile.d/hive.sh
	. /etc/profile.d/hive.sh
}

function initSchema {
	wget http://central.maven.org/maven2/mysql/mysql-connector-java/8.0.7-dmr/mysql-connector-java-8.0.7-dmr.jar
	mv mysql-connector-java-8.0.7-dmr.jar $HIVE_HOME/lib/
	$HIVE_HOME/bin/schematool -dbType mysql -initSchema
}

echo "setup hive"

installHive
setupHive
setupEnvVars
initSchema

echo "hive setup complete"
