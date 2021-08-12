#!/bin/bash

#from /id1
cd $(pwd)/id1
echo $(pwd)
docker build -t kafka1 -f Dockerfile-kafka1 .

#from /id2
cd $(pwd)/../id2
echo $(pwd)
docker build -t kafka2 -f Dockerfile-kafka2 .

#from /id3
cd $(pwd)/../id3
echo $(pwd)
docker build -t kafka3 -f Dockerfile-kafka3 .