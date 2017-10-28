#!/usr/bin/env bash
set -e # halt script on error

docker build -t rsyslog-forwarder .
docker run --rm -d -p 514:514/udp --name forwarder rsyslog-forwarder
