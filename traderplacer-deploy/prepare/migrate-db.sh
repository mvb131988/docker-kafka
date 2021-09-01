#!/bin/bash

CONTAINER_ID=$(docker container ls | grep 'postgres-traderplacer' | cut -d' ' -f1)
docker exec -i $CONTAINER_ID psql -U postgres -d trader < ./db/trader_dev_dump.sql