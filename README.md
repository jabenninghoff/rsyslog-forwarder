# rsyslog-forwarder
[![Build Status](https://travis-ci.org/jabenninghoff/rsyslog-forwarder.svg?branch=master)](https://travis-ci.org/jabenninghoff/rsyslog-forwarder)

Simple rsyslog Docker image optimized for parsing and forwarding logs

### Uses

Launch to echo logs received by syslog (514/udp) to stdout:
`docker run --rm -it -p 514:514/udp --name forwarder jbenninghoff/rsyslog-forwarder`

Use `docker-compose` to standardize syslog messages using [syslog parsing](http://www.rsyslog.com/doc/syslog_parsing.html):

Copy the default files:
```
mkdir /forwarder
cd /forwarder
wget https://raw.githubusercontent.com/jabenninghoff/rsyslog-forwarder/master/rsyslog.conf
```

Create a *docker-compose.yml* file:
```
version: '2'
services:
  forwarder:
    image: "jbenninghoff/rsyslog-forwarder"
    volumes:
      - /forwarder/rsyslog.conf:/etc/rsyslog.conf
    ports:
      - "514/udp:514/udp"
      - "10514/tcp:10514/tcp"
```
