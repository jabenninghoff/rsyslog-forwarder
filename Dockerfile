FROM alpine
RUN apk add --no-cache rsyslog rsyslog-tls logrotate tzdata

COPY rsyslog.conf /etc/
COPY rsyslog-forwarder-start /usr/local/bin/

VOLUME /var/run/rsyslog/dev
EXPOSE 514 10514

CMD ["rsyslog-forwarder-start"]
