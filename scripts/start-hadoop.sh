#!/bin/bash

source "/vagrant/scripts/common.sh"

function startDaemons {
    echo "starting Hadoop daemons"
    hdfs --config $HADOOP_CONF_DIR --daemon start namenode
    hdfs --config $HADOOP_CONF_DIR --daemon start datanode
    yarn --config $HADOOP_CONF_DIR --daemon start resourcemanager
    yarn --config $HADOOP_CONF_DIR --daemon start nodemanager
    yarn --config $HADOOP_CONF_DIR --daemon start proxyserver 
    yarn --config $HADOOP_CONF_DIR --daemon start historyserver

    echo "waiting for HDFS to come up"
    # loop until at least HDFS is up
    cmd="hdfs dfs -ls /"
    NEXT_WAIT_TIME=0
    up=0
    while [  $NEXT_WAIT_TIME -ne 4 ] ; do
        $cmd
        rc=$?
        if [[ $rc == 0 ]]; then
            up=1
            break
        fi
       sleep $(( NEXT_WAIT_TIME++ ))
    done

    if [[ $up != 1 ]]; then
        echo "HDFS doesn't seem to be up; exiting"
        exit $rc
    fi

    echo "listing all Java processes"
    jps
}

startDaemons
