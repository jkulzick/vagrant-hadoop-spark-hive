#!/bin/bash

set -e

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set -x

source "/vagrant/scripts/common.sh"

function installPython {
    echo "installing python"
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm
    yum install -y python36u
    yum install -y python36u-pip
    yum install -y python36u-devel
}

echo "setup python"

installPython

echo "python setup complete"

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set +x