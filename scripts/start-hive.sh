#!/bin/bash

# http://www.cloudera.com/content/cloudera/en/documentation/cdh4/v4-2-0/CDH4-Installation-Guide/cdh4ig_topic_18_4.html

function runHiveServices {
	echo "running hive metastore"
	nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 &

	echo "running hive server2"
	nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 &
}

echo "start hive services"

runHiveServices

echo "hive services running"



