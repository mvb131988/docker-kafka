#!/bin/bash

echo "--------------------------"
echo "Stopping tradeplacer"
for n in $(docker container ls | grep 'tradeplacer' | cut -d' ' -f1)
do
	docker container kill $n
done
echo "------------