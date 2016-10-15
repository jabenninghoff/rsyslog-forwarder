FROM alpine
COPY packages/ /packages/
COPY keys/ /etc/apk/keys/
RUN echo "/packages" >> /etc/apk/repositories

RUN apk add --no-cache rsyslog-tls rsyslog-normalize tzdata

COPY etc/ /etc/

VOLUME /var/run/rsyslog/dev
EXPOSE 10514/tcp 514/udp

CMD ["rsyslogd", "-n"]
