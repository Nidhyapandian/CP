#! /bin/bash
# docker image creation
docker build -t myapp .
# docker container creation
docker-compose up -d
