#!/bin/bash

set -e


# Generate the config only if it doesn't exist
CONFIG="$STORM_CONF_DIR/storm.yaml"
if [ ! -f "$CONFIG" ]; then
    cat << EOF > "$CONFIG"
storm.zookeeper.servers: [zookeeper]
nimbus.seeds: [nimbus]
storm.log.dir: "$STORM_LOG_DIR"
storm.local.dir: "$STORM_DATA_DIR"
EOF
fi

exec "$@"