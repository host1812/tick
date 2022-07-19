#!/bin/bash

# gets list of all databases and
# checks retention policies for each
# needs to be run as root

function log {
    echo "$(date --iso-8601=seconds) ${*}"
}

databases=($(docker exec -it influxdb influx \
    -ssl \
    -unsafeSsl \
    -precision=rfc3339 \
    -execute "SHOW DATABASES"))

for db in ${databases[@]:4}
do
    log "db name: ${db}"
done
