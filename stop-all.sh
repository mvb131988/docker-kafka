#!/bin/bash

for n in $(docker container ls | grep 'kafka*.' | cut -d' ' -f1)
do
	docker container kill $n
done