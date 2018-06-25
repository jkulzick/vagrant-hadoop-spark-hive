#!/bin/bash

set -e

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set -x

function setupUtilities {
    # update the locate database
    updatedb
}

echo "finalize centos"
setupUtilities

[ "$SPARK_CAVEMAN_DEBUG" == 'true' ] && set +x