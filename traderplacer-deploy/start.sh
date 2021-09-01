#!/bin/sh

#build war
mvn -f ../. clean install -DskipTests

docker build -t traderplacer -f Dockerfile .
docker run -d -p 8080:8080 -p 8443:8443 -p 8787:8787 --net kafka-network --ip 172.20.0.17 traderplacer