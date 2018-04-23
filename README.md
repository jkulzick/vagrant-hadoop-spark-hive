Vagrant for Hadoop, Spark and Hive
==================================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 2.7.5
* Hive 2.3.2
* Spark 2.2.1

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server

# Getting Started

1. [Download and install VirtualBox 5.1.x](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html)
3. [Download and install Git for Windows](https://git-scm.com/) (Windows only)
4. Open Terminal or Git Bash
5. Run ```vagrant box add centos/7```
6. Go to [releases](https://github.com/Tello-Wharton/vagrant-hadoop-spark-hive/releases) and download and extract the latest source of this project.
7. Run ```chmod -R 755 vagrant-hadoop-spark-hive``` where "vagrant-hadoop-spark-hive" is the name of the project folder (Linux and Mac only)
8. In your terminal change your directory into the project directory (i.e. `cd vagrant-hadoop-spark-hive`).
9. Run ```vagrant up``` to create the VM.
10. Use ```vagrant ssh``` to login to the VM.
11. When inside the shell, use ```sudo -s``` to switch to root, which is how you should access Hadoop, Spark and Hive services.

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

# Future plans
* Consistently keep project up to date with modern versions of services such as Hadoop, Spark and Hive
* Consider other useful services related to Hadoop, Spark and Hive to be added
* Work towards provisioning multiple boxes to work together over a local network
* Make .sh scripts work to provision environment on a regular centos machine such as a server

# Credits

This project is based on the great work carried out at
(https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1).
