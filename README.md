# rsyslog-forwarder

Simple rsyslog Docker image optimized for parsing and forwarding logs

### Uses

Launch to echo logs received by syslog (514/udp) to stdout:
`docker run --rm -it -p 514:514/udp --name forwarder jbenninghoff/rsyslog-forwarder`
