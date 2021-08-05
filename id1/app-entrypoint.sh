#!/bin/bash

#zookeeper is deprecated
#/tmp/zookeeper/bin/zkServer.sh start

/tmp/kafka/bin/kafka-server-start.sh -daemon /tmp/kafka/config/kraft/server.properties

while true; do sleep 1000; done