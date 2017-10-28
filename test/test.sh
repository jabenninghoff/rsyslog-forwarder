#!/usr/bin/env bash
set -e # halt script on error

# verify all expected processes are running
CONTAINER="rsyslog-forwarder"
COUNT="3"
FILTER="supervisord|crond|rsyslogd"

PS=`docker exec $CONTAINER "/bin/ps" | egrep $FILTER | wc -l | sed 's/^ *//'`
if [ $PS != $COUNT ]
then
  echo "FAIL: was expecting $COUNT processes, found: $PS"
  docker exec $CONTAINER "/bin/ps" | egrep $FILTER
  exit 1
fi

echo "SUCCESS: expecting $COUNT processes, found: $PS"
docker exec $CONTAINER "/bin/ps" | egrep $FILTER
exit 0
