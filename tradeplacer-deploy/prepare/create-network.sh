#!/bin/bash

echo "--------------------------";
if [ -z $(docker network ls | grep 'tradeplacer*.' | cut -d ' ' -f 1) ]; 
then 
	docker network create --subnet=172.13.0.0/16 tradeplacer-network
	if [ $? -eq 0 ]; then
		echo "Network is created";
	else
		echo "Failed to create network"
	fi	
else 
	echo "Network is already created";
fi
echo "--------------------------";