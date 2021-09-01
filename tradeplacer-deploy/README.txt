#############################################
#environment preparation stage
#############################################

#execute from /tradeplacer-deploy/prepare

#172.13.0.0/16
(1) ./create-network.sh

#172.13.0.13
(2) ./start-kafka.sh

#172.13.0.16
(3) ./start-db.sh

(4) ./migrate-db.sh

#############################################

#############################################
#tradeplacer build&start stage
#############################################

#execute from /tradeplacer-deploy

./start.sh