#!/bin/bash

container_ips=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}:6379{{end}}' $(docker ps | grep redis-cluster_redis- | awk '{print $1}'))

docker exec -it redis-cluster_redis-1_1 redis-cli --cluster create $container_ips --cluster-replicas 1