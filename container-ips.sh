#!/bin/bash

docker inspect --format='{{.Config.Hostname}} {{index .Config.Labels "com.docker.compose.service"}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps | grep redis-cluster_redis- | awk '{print $1}')