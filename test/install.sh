#!/usr/bin/env bash
set -e # halt script on error

CONTAINER="rsyslog-forwarder"
PORTS="514:514/udp"

docker build -t $CONTAINER .
docker run --rm -d -p $PORTS --name $CONTAINER $CONTAINER

# wait 10 seconds for docker to fully start or test.sh will fail
sleep 10
