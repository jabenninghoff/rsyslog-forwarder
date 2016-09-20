FROM alpine
RUN apk add --no-cache rsyslog

COPY etc/ /etc/

VOLUME /var/run/rsyslog/dev
EXPOSE 10514/tcp 514/udp

CMD ["rsyslogd", "-n"]
