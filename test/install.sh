#!/usr/bin/env bash
set -e # halt script on error

docker build -t rsyslog-forwarder .
docker run --rm -d -p 514:514/udp --name forwarder rsyslog-forwarder

# wait 10 seconds for docker to fully start or test.sh will fail
sleep 10
