Vagrant for Hadoop, Spark and Hive
==================================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 3.1.0
* Hive 3.1.0
* Spark 2.3.1

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server

# Getting Started

1. Run `git clone git@github.com:jkulzick/vagrant-hadoop-spark-hive`
2. Run `cd vagrant-hadoop-spark-hive`
3. Run `setup.sh` to install the required dependencies
   (virtualbox, vagrant, etc.)
4. Run `vagrant up` to create the VM.
5. Use `vagrant ssh` to login to the VM.
6. When inside the shell, use `sudo -s` to switch to root, which is how
   you should access Hadoop, Spark and Hive services.

# Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://10.211.55.101:8088)
* Job history:  (http://10.211.55.101:19888/jobhistory/)
* HDFS: (http://10.211.55.101:50070/dfshealth.html)
* Spark history server: (http://10.211.55.101:18080)
* Spark context UI (if a Spark context is running): (http://10.211.55.101:4040)

# Validating your virtual machine setup

To test out the virtual machine setup, and for examples of how to run
MapReduce, Hive and Spark, head on over to [VALIDATING.md](VALIDATING.md).

# Starting services in the event of a system restart

Upon system restart, all services should begin accordingly.

# More advanced setup

If you'd like to learn more about working and optimizing Vagrant then
take a look at [ADVANCED.md](ADVANCED.md).

# For developers

The file [DEVELOP.md](DEVELOP.md) contains some tips for developers.

# Credits

This project is based on the great work carried out at
(https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1).
