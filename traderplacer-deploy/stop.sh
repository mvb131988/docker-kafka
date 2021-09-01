#!/bin/bash

echo "--------------------------"
echo "Stopping postgres"
for n in $(docker container ls | grep 'traderplacer' | cut -d' ' -f1)
do
	docker container kill $n
done
echo "------------