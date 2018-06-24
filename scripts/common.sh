#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz

# hadoop
HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF=$HADOOP_HOME/etc/hadoop
HADOOP_VERSION=hadoop-3.1.0
HADOOP_ARCHIVE_PREFIX=$HADOOP_VERSION
HADOOP_ARCHIVE=$HADOOP_ARCHIVE_PREFIX.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://apache.mirrors.tds.net/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# aws
HADOOP_AWS_VERSION=3.1.0
HADOOP_AWS_JAR_PREFIX=hadoop-aws-$HADOOP_AWS_VERSION
HADOOP_AWS_JAR=$HADOOP_AWS_JAR_PREFIX.jar
HADOOP_AWS_MAVEN_DOWNLOAD=http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_VERSION/$HADOOP_AWS_JAR

AWS_JAVA_VERSION=1.11.351
AWS_JAVA_JAR_PREFIX=aws-java-sdk-bundle-$AWS_JAVA_VERSION
AWS_JAVA_JAR=$AWS_JAVA_JAR_PREFIX.jar
AWS_JAVA_MAVEN_DOWNLOAD=http://central.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_JAVA_VERSION/$AWS_JAVA_JAR

# hive
HIVE_VERSION=hive-3.0.0
HIVE_ARCHIVE_PREFIX=apache-$HIVE_VERSION-bin
HIVE_ARCHIVE=$HIVE_ARCHIVE_PREFIX.tar.gz
HIVE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF=/usr/local/hive/conf

# spark
SPARK_VERSION=spark-2.3.1
SPARK_ARCHIVE_PREFIX=$SPARK_VERSION-bin-without-hadoop
SPARK_ARCHIVE=$SPARK_ARCHIVE_PREFIX.tgz
SPARK_MIRROR_DOWNLOAD=http://archive.apache.org/dist/spark/$SPARK_VERSION/$SPARK_ARCHIVE
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

# ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x