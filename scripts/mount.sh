#!/bin/bash

yum -y install epel-release
yum -y install ntfs-3g

mkdir -p /mnt/big_boi
sudo mount -t ntfs /dev/sdb2 /mnt/big_boi