#!/usr/bin/env bash
set -e # halt script on error

# verify all 3 expected processes are running
COUNT="3"
FILTER="supervisord|crond|rsyslogd"

PS=`docker exec forwarder "/bin/ps" | egrep $FILTER | wc -l | sed 's/^ *//'`
if [ $PS != $COUNT ]
then
  echo "FAIL: was expecting $COUNT processes, found: $PS"
  docker exec forwarder "/bin/ps" | egrep "supervisord|crond|rsyslogd"
  exit 1
fi

echo "SUCCESS: expecting $COUNT processes, found: $PS"
docker exec forwarder "/bin/ps" | egrep "supervisord|crond|rsyslogd"
exit 0
