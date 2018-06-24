#!/bin/bash

set -e

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set -x

function setupUtilities {
    # update the locate database
    updatedb
}

echo "finalize centos"
setupUtilities

[ "$DEBUG_SPARK_VAGRANT" == 'true' ] && set +x