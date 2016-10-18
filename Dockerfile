FROM alpine
RUN apk add --no-cache rsyslog rsyslog-tls logrotate tzdata

COPY etc/ /etc/

VOLUME /var/run/rsyslog/dev
EXPOSE 514 10514

CMD ["rsyslogd", "-n"]
