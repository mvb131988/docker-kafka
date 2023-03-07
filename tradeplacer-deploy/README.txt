#############################################
#tradeplacer checkout + adjustments WAR build stage
#############################################

(1) Clone git repos:
	+ api-server
	+ admin-messaging
	+ fix-messaging
	+ fix-sbe-messaging
	+ infrastructure-messaging
	
(2) build projects (mvn clean install):
	+ admin-messaging
	+ fix-messaging
	+ fix-sbe-messaging
	+ infrastructure-messaging
	
(3) install legacy libs (execute from /attachments/jsse-1_0_3_03):

mvn install:install-file -Dfile=jsse.jar -DgroupId=com.sun.net.ssl.internal.ssl -DartifactId=jsse -Dversion=1.0.3 -Dpackaging=jar -DgeneratePom=false
mvn install:install-file -Dfile=jcert.jar -DgroupId=com.sun.net.ssl.internal.ssl -DartifactId=jcert -Dversion=1.0.3 -Dpackaging=jar -DgeneratePom=false
mvn install:install-file -Dfile=jnet.jar -DgroupId=com.sun.net.ssl.internal.ssl -DartifactId=jnet -Dversion=1.0.3 -Dpackaging=jar -DgeneratePom=false 

(4) For some reasons at this moment there are 
compilation errors in master branch of api-server
(classes PositionReport and SecurityDefinitionAdminMessage).
Comment out lines with compilation errors.

(5) Go to api-server (tradeplacer-api) and change pom file according to screenshot.
At this moment it should be possible to build api-server with mvn clean install. 
In order to launch it all further steps are required. 

(6) Change config.properties, kafka-consumer.properties, kafka-producer.properties
according to screenshot.

#############################################
#environment preparation stage
#############################################

Precondition:
+ Copy /attachments/tradeplacer-deploy to /tradeplacer-api/tradeplacer-deploy 
 
#execute all 4 steps from /tradeplacer-api/tradeplacer-deploy/prepare

#172.13.0.0/16
(1) ./create-network.sh

#172.13.0.13
(2) ./start-kafka.sh

# Note: there are no other postgres docker containers running.
#If there are kill them. 
#172.13.0.16
(3) ./start-db.sh

(4) ./migrate-db.sh

#############################################

#############################################
#tradeplacer build(WAR + docker image)&start stage
#############################################

#execute from /tradeplacer-api/tradeplacer-deploy

./start.sh

# use http://localhost:8080/api/getInstruments
# to test the app if startup is successful