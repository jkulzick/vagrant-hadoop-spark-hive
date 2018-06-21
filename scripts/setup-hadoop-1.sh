#!/bin/bash

set -e -x

# https://hadoop.apache.org/docs/r2.4.1/hadoop-yarn/hadoop-yarn-common/yarn-default.xml

source "/vagrant/scripts/common.sh"

function setupHadoop {
	echo "creating hadoop directories"
	mkdir /var/hadoop
	mkdir /var/hadoop/hadoop-datanode
	mkdir /var/hadoop/hadoop-namenode
	mkdir /var/hadoop/mr-history
	mkdir /var/hadoop/mr-history/done
	mkdir /var/hadoop/mr-history/tmp
	
	echo "copying over hadoop configuration files"
	cp -f $HADOOP_RES_DIR/* $HADOOP_CONF
}

function setupEnvVars {
	echo "creating hadoop environment variables"
	cp -f $HADOOP_RES_DIR/hadoop.sh /etc/profile.d/hadoop.sh
	. /etc/profile.d/hadoop.sh
}

function installHadoop {
	if ! resourceExists $HADOOP_ARCHIVE; then
	    echo "downloading $HADOOP_ARCHIVE"
	    curl -sS -o /vagrant/resources/$HADOOP_ARCHIVE -O -L $HADOOP_MIRROR_DOWNLOAD
	fi

    echo "installing hadoop"
	tar -xzf /vagrant/resources/$HADOOP_ARCHIVE -C /usr/local
	ln -s /usr/local/$HADOOP_ARCHIVE_PREFIX /usr/local/hadoop
}

function formatHdfs {
    echo "formatting HDFS"
    hdfs namenode -format
}

function installHadoopAws {
	if ! resourceExists $HADOOP_AWS_JAR; then
	    echo "downloading $HADOOP_AWS_JAR"
	    curl -sS -o /vagrant/resources/$HADOOP_AWS_JAR -O -L $HADOOP_AWS_MAVEN_DOWNLOAD
	fi

    cp -f /vagrant/resources/$HADOOP_AWS_JAR $HADOOP_HOME/share/hadoop/tools/lib
}

function installAwsJava {
	if ! resourceExists $AWS_JAVA_JAR; then
	    echo "downloading $AWS_JAVA_JAR"
	    curl -sS -o /vagrant/resources/$HADOOP_AWS_JAR -O -L $AWS_JAVA_MAVEN_DOWNLOAD
	fi

    cp -f /vagrant/resources/$AWS_JAVA_JAR $HADOOP_HOME/share/hadoop/tools/lib
}

echo "setup hadoop"

installHadoop
setupHadoop
setupEnvVars
formatHdfs
installHadoopAws
installAwsJava
