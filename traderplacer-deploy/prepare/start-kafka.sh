#!/bin/bash

echo "--------------------------"
echo "Build kafka image"
docker build -t kafka-traderplacer -f kafka/Dockerfile-kafka .
echo "--------------------------"

echo "--------------------------"
echo "Starting kafka"
docker run -d --net traderplacer-network --ip 172.13.0.13 kafka-traderplacer
echo "--------------------------"