#!/bin/bash

set -e -x

source "/vagrant/scripts/common.sh"

function stopDaemons {
    echo "stopping Hadoop daemons"
    $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver --config $HADOOP_CONF_DIR
    $HADOOP_YARN_HOME/sbin/stop-all.sh

    echo "listing all Java processes"
    jps
}

stopDaemons
