#!/bin/bash
x=$(/tmp/kafka/bin/kafka-storage.sh random-uuid)
echo $x
y=$(/tmp/kafka/bin/kafka-storage.sh format -t $x -c /tmp/kafka/config/kraft/server.properties)
echo $y