# rsyslog-forwarder

Simple rsyslog Docker image optimized for parsing and forwarding logs

### Uses

Launch to echo logs received by syslog (514/udp) to stdout:
`docker run --rm -it -p 514:514/udp --name forwarder jbenninghoff/rsyslog-forwarder`

Use `docker-compose` to standardize syslog messages using [syslog parsing](http://www.rsyslog.com/doc/syslog_parsing.html):
```
version: '2'
services:
  forwarder:
    image: "jbenninghoff/rsyslog-forwarder"
    volumes:
      - /forwarder/config/rsyslog.d:/etc/rsyslog.d
    ports:
      - "514/udp:514/udp"
      - "10514/tcp:10514/tcp"
```
