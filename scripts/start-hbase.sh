#!/bin/bash

source "/vagrant/scripts/common.sh"

function startServices {
	echo "starting hbase"
	/usr/local/hbase/bin/start-hbase.sh
}
