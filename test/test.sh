#!/usr/bin/env bash
set -e # halt script on error

. test/variables.sh

# verify all expected processes are running
PS=`docker exec $CONTAINER "/bin/ps" | egrep $FILTER | wc -l | sed 's/^ *//'`
if [ $PS != $PSCOUNT ]
then
  echo "FAIL: was expecting $PSCOUNT processes, found: $PS"
  docker exec $CONTAINER "/bin/ps" | egrep $FILTER
  exit 1
fi

echo "SUCCESS: expecting $PSCOUNT processes, found: $PS"
docker exec $CONTAINER "/bin/ps" | egrep $FILTER
exit 0
