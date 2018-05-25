#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalHbase {
	echo "install hbase from local file"
	FILE=/vagrant/resources/$HBASE_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteHbase {
	echo "install hbase from remote file"
	curl -sS -o /vagrant/resources/$HBASE_ARCHIVE -O -L $HBASE_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$HBASE_ARCHIVE -C /usr/local
}

function installHbase {
	if resourceExists $HBASE_ARCHIVE; then
		installLocalHbase
	else
		installRemoteHbase
	fi
	ln -s /usr/local/$HBASE_VERSION /usr/local/hbase
}

function setupHbase {
	
	echo "copying over hbase configuration files"
	cp -f $HBASE_RES_DIR/* $HBASE_CONF

}

installHbase
setupHbase