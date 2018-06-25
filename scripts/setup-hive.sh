#!/bin/bash

set -e

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set -x

# http://www.cloudera.com/content/cloudera/en/documentation/cdh4/v4-2-0/CDH4-Installation-Guide/cdh4ig_topic_18_4.html

source "/vagrant/scripts/common.sh"

function installHive {
	if ! resourceExists $HIVE_ARCHIVE; then
	    echo "downloading $HIVE_ARCHIVE"
	    curl -sS -o /vagrant/resources/$HIVE_ARCHIVE -O -L $HIVE_MIRROR_DOWNLOAD
	fi

    echo "installing hive"
	tar -xzf /vagrant/resources/$HIVE_ARCHIVE -C /usr/local
	ln -s -f /usr/local/$HIVE_ARCHIVE_PREFIX /usr/local/hive
	mkdir -p /usr/local/hive/logs /usr/local/hive/derby/
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
	wget http://central.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.2.5/mariadb-java-client-2.2.5.jar
	mv mariadb-java-client-2.2.5.jar $HIVE_HOME/lib/
	$HIVE_HOME/bin/schematool -dbType mysql -initSchema
}

echo "setup hive"

installHive
setupHive
setupEnvVars
initSchema

echo "hive setup complete"

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set +x