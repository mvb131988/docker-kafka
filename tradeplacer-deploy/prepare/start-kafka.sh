#!/bin/bash

echo "--------------------------"
echo "Build kafka image"
docker build -t kafka-tradeplacer -f kafka/Dockerfile-kafka .
echo "--------------------------"

echo "--------------------------"
echo "Starting kafka"
docker run -d --net tradeplacer-network --ip 172.13.0.13 kafka-tradeplacer
echo "--------------------------"