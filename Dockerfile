FROM alpine
RUN apk add --no-cache rsyslog rsyslog-tls logrotate supervisor tzdata

COPY rsyslog.conf /etc/
COPY supervisord.conf /etc/

VOLUME /var/run/rsyslog/dev
EXPOSE 514 10514

CMD ["supervisord", "-c","/etc/supervisord.conf"]
