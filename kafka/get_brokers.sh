#!/bin/bash

KAFKA_PORT=9092
echo $(for CONTAINER in $(docker ps | grep $KAFKA_PORT | awk '{print $1}'); do docker port $CONTAINER $KAFKA_PORT | sed -e "s/0.0.0.0:/$HOSTIP:/g"; done) | sed -e 's/ /,/g'
