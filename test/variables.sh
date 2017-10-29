#!/usr/bin/env bash

# variables used for test scripts

# container name to use
CONTAINER="rsyslog-forwarder"
# ports to open on the container
PORTS="514:514/udp"
# length of time to wait for docker container to start
WAIT="5"
# egrep filter to use to find running processes
FILTER="supervisord|crond|rsyslogd"
# number of processes expected
PSCOUNT="3"
