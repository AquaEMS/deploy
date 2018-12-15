#!/bin/bash

git -C /usr/aquaems/docker/aquaems/src/www/ reset --hard HEAD
git -C /usr/aquaems/docker/aquaems/src/www pull

docker build -t aquaems/aquaems /usr/aquaems/docker/aquaems
docker stop aquaems.com
docker rm aquaems.com
docker run -p 80:80 -d --name aquaems.com aquaems/aquaems
#docker images -q | xargs docker rmi
docker image prune -a -f
