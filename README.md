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

1. Run `git clone git@github.com:jkulzick/vagrant-hadoop-spark-hive` if you do
   not have the project or `git pull` from the project directory to pull the
   latest version.
2. Change to the project directory if you are not already there
   (i.e. `cd vagrant-hadoop-spark-hive`).
3. Run `tbd` if this is your first time to install the required dependencies
4. Run ```vagrant up``` to create the VM.
5. Use ```vagrant ssh``` to login to the VM.
6. When inside the shell, use ```sudo -s``` to switch to root, which is how
   you should access Hadoop, Spark and Hive services.


1. [Download and install VirtualBox 5.2.12](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html)
4. Run ```vagrant box add centos/7```
7. In your terminal change your directory into the project directory (i.e. `cd vagrant-hadoop-spark-hive`).

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
