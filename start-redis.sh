#!/bin/bash

PORT=${PORT}
MASTER_IP=${MASTER_IP}
MASTER_PORT=${MASTER_PORT}
REDIS_CONFIGURATION_FILE=/etc/redis.conf

echo "bind 0.0.0.0" > $REDIS_CONFIGURATION_FILE
echo "port ${PORT}" >> $REDIS_CONFIGURATION_FILE
echo "dir ." >> $REDIS_CONFIGURATION_FILE

if [ -n "${MASTER_IP}" ] && [ -n "${MASTER_PORT}" ]; then
  echo "Redis running as a slave"
  echo "slaveof ${MASTER_IP} ${MASTER_PORT}" >> $REDIS_CONFIGURATION_FILE
fi

/usr/local/bin/redis-server $REDIS_CONFIGURATION_FILE
