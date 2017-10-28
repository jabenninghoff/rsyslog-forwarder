#!/usr/bin/env bash
set -e # halt script on error

# stop running docker and remove volume & image
docker rm -vf forwarder
docker rmi rsyslog-forwarder
