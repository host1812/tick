#!/bin/bash

# gets list of all databases and
# checks retention policies for each
# needs to be run as root

INFLUX_CMD="docker exec -it influxdb influx \
    -ssl \
    -unsafeSsl \
    -precision=rfc3339 \
    -execute"

function log {
    echo "$(date --iso-8601=seconds) ${*}"
}

databases=($($INFLUX_CMD "SHOW DATABASES"))

for db in ${databases[@]:4}
do
    retention_policy=$($INFLUX_CMD "SHOW RETENTION POLICIES ON $db")
    echo "db name: ${db}"
    echo "${retention_policy}"
    echo
done
