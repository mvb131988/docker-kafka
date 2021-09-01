#!/bin/sh

#############################################
#build war
#############################################
echo "--------------------------"
echo "Build war file"
echo "--------------------------"

cp ../config.properties ../src/main/resources/
cp ../kafka-consumer.properties ../src/main/resources/
cp ../kafka-producer.properties ../src/main/resources/
cp ../log4j2.properties ../src/main/resources/

mvn -f ../. clean install -DskipTests
mv ../target/$(ls ../target/ | grep 'trade.*.war') ../target/ROOT.war

rm ../src/main/resources/config.properties
rm ../src/main/resources/kafka-consumer.properties
rm ../src/main/resources/kafka-producer.properties
rm ../src/main/resources/log4j2.properties

#############################################
#build and start docker container
#############################################
echo "--------------------------"
echo "Build docker file"
echo "--------------------------"

cp ../target/ROOT.war ROOT.war
docker build -t tradeplacer -f Dockerfile .
rm ROOT.war

echo "--------------------------"
echo "Starting app"
echo "--------------------------"
docker run -p 8080:8080 -p 8443:8443 -p 8787:8787 --net tradeplacer-network --ip 172.13.0.17 tradeplacer