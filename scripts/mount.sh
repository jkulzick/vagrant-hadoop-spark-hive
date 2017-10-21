#!/bin/bash

yum -y install epel-release
yum -y install ntfs-3g

mkdir -p /mnt/big_boi
sudo mount -t ntfs /dev/sdb2 /mnt/big_boi

mkdir -p /mnt/big_boi/hadoop_data
mkdir -p /mnt/big_boi/hadoop_data/hadoop-namenode
mkdir -p /mnt/big_boi/hadoop_data/hadoop-datanode
