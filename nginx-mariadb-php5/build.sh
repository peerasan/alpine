#!/bin/bash

docker stop pat
docker rm pat
docker rmi pat
docker build -t pat .
docker run --name pat -v $PWD/apps:/apps -p 80:80 -d pat:latest
docker exec -ti pat sh
