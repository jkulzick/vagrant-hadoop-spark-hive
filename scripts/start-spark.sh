#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

# http://www.cloudera.com/content/cloudera/en/documentation/core/v5-2-x/topics/cdh_ig_spark_configure.html

source "/vagrant/scripts/common.sh"

function startServices {
	echo "starting Spark history service"
	/usr/local/spark/sbin/start-history-server.sh
}

startServices

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x