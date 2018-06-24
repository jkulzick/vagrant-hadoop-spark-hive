#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

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

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x