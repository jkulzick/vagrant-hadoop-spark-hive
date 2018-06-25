#!/bin/bash

set -e

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set -x

source "/vagrant/scripts/common.sh"

function installLocalJava {
	echo "installing oracle jdk"
	FILE=/vagrant/resources/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteJava {
	echo "install open jdk"
	yum install -y java-1.8.0-openjdk*
}

function setupJava {
	echo "setting up java"
	if resourceExists $JAVA_ARCHIVE; then
		ln -s -f /usr/local/jdk1.8.0_51 /usr/local/java
	else
		ln -s -f /usr/lib/jvm/jre /usr/local/java
	fi
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

function installJava {
	if resourceExists $JAVA_ARCHIVE; then
		installLocalJava
	else
		installRemoteJava
	fi
}

echo "setup java"

installJava
setupJava
setupEnvVars

echo "java setup complete"

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set +x