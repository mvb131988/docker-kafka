#!/bin/bash

docker run -d -p 2181:2181 --net kafka-network --ip 172.20.0.13 kafka1
docker run -d -p 2182:2181 --net kafka-network --ip 172.20.0.14 kafka2
docker run -d -p 2183:2181 --net kafka-network --ip 172.20.0.15 kafka3