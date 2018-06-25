#!/bin/bash

set -e

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set -x

# http://www.cloudera.com/content/cloudera/en/documentation/core/v5-2-x/topics/cdh_ig_spark_configure.html

source "/vagrant/scripts/common.sh"

function setupSpark {
	echo "setup spark"
	cp -f /vagrant/resources/spark/slaves /usr/local/spark/conf
	cp -f /vagrant/resources/spark/spark-env.sh /usr/local/spark/conf
	cp -f /vagrant/resources/spark/spark-defaults.conf /usr/local/spark/conf

	# allows spark to write to hive
	ln -s -f $HIVE_CONF_DIR/hive-site.xml $SPARK_CONF_DIR/hive-site.xml
}

function setupEnvVars {
	echo "creating spark environment variables"
	cp -f $SPARK_RES_DIR/spark.sh /etc/profile.d/spark.sh
	. /etc/profile.d/spark.sh
}

function setupHistoryServer {
	echo "setup history server"
	. /etc/profile.d/hadoop.sh
    hdfs dfs -mkdir -p /user/spark/applicationHistory
    hdfs dfs -chmod -R 777 /user/spark
}

function installSpark {
	if ! resourceExists $SPARK_ARCHIVE; then
	    echo "downloading $SPARK_ARCHIVE"
	    curl -sS -o /vagrant/resources/$SPARK_ARCHIVE -O -L $SPARK_MIRROR_DOWNLOAD
	fi

    echo "installing spark"
    tar -xzf /vagrant/resources/$SPARK_ARCHIVE -C /usr/local
	ln -s -f /usr/local/$SPARK_ARCHIVE_PREFIX /usr/local/spark
	mkdir -p /usr/local/spark/logs/history
}


echo "setup spark"

installSpark
setupSpark
setupEnvVars
setupHistoryServer


echo "spark setup complete"

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set +x