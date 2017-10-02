#!/bin/sh

export SPARK_HOME=/usr/local/spark
export PATH=${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}

# Add hadoop native library

if [ -z "$var" ]
then
	export LD_LIBRARY_PATH=${HADOOP_YARN_HOME}/lib/native/
else
	export LD_LIBRARY_PATH=${HADOOP_YARN_HOME}/lib/native/:${LD_LIBRARY_PATH}
fi