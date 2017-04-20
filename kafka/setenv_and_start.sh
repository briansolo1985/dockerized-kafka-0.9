#!/bin/bash

KAFKA_SERVER_PROPERTIES=$KAFKA_HOME/config/server.properties
KAFKA_PORT=9092

rm $KAFKA_SERVER_PROPERTIES

echo "listeners=PLAINTEXT://:9092" >> $KAFKA_SERVER_PROPERTIES
echo "num.network.threads=3" >> $KAFKA_SERVER_PROPERTIES
echo "num.io.threads=8" >> $KAFKA_SERVER_PROPERTIES
echo "socket.send.buffer.bytes=102400" >> $KAFKA_SERVER_PROPERTIES
echo "socket.receive.buffer.bytes=102400" >> $KAFKA_SERVER_PROPERTIES
echo "socket.request.max.bytes=104857600" >> $KAFKA_SERVER_PROPERTIES
echo "num.partitions=1" >> $KAFKA_SERVER_PROPERTIES
echo "num.recovery.threads.per.data.dir=1" >> $KAFKA_SERVER_PROPERTIES
echo "log.retention.hours=168" >> $KAFKA_SERVER_PROPERTIES
echo "log.segment.bytes=1073741824" >> $KAFKA_SERVER_PROPERTIES
echo "log.retention.check.interval.ms=300000" >> $KAFKA_SERVER_PROPERTIES

echo "port=$KAFKA_PORT" >> $KAFKA_SERVER_PROPERTIES
echo "broker.id=-1" >> $KAFKA_SERVER_PROPERTIES
echo "log.dirs=/kafka/kafka-logs-$HOSTNAME" >> $KAFKA_SERVER_PROPERTIES

echo "zookeeper.connect=$(env | grep ZOOKEEPER_PORT_2181_TCP= | sed -e 's|.*tcp://||' | paste -sd ,)" >> $KAFKA_SERVER_PROPERTIES
echo "advertised.host.name=$KAFKA_ADVERTISED_HOSTNAME" >> $KAFKA_SERVER_PROPERTIES
echo "advertised.port=$(docker port `hostname` $KAFKA_PORT | sed -r "s/.*:(.*)/\1/g")" >> $KAFKA_SERVER_PROPERTIES

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_SERVER_PROPERTIES
