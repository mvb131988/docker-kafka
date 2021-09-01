#############################################
#environment preparation stage
#############################################

#execute from /traderplacer-deploy/prepare

(1) ./create-network.sh

(2) ./start-kafka.sh

(3) ./start-db.sh

(4) ./migrate-db.sh

#############################################

#############################################
#traderplacer build&start stage
#############################################

#execute from /traderplacer-deploy