#!/bin/bash

echo "--------------------------"
echo "Stopping kafka"
for n in $(docker container ls | grep 'kafka-traderplacer' | cut -d' ' -f1)
do
	docker container kill $n
done
echo "--------------------------"