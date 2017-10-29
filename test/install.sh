#!/usr/bin/env bash
set -e # halt script on error

. test/variables.sh

docker build -t $CONTAINER .
docker run --rm -d -p $PORTS --name $CONTAINER $CONTAINER

# wait for docker to fully start or test.sh will fail
sleep $WAIT
