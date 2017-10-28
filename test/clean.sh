#!/usr/bin/env bash
set -e # halt script on error

docker rm -vf forwarder
docker rmi rsyslog-forwarder
