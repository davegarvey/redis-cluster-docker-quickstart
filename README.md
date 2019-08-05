# Redis Cluster Docker Quickstart

Creates 6 containers with associated volumes and attaches them to a single network so they can communicate.

Scripts provide simple way to get info about the Redis Cluster nodes.

Prerequiste: Docker and Docker Compose installed. Redis Docker images for Redis v5+.

## Get started

1. Create the containers, volumes and network using Docker Compose

        docker-compose up

2. Update scripts to be executable

        chmod +x *.sh
        
3. Run the create cluster script and enter 'yes' when prompted

        ./create-cluster.sh

You now have a Redis Cluster running!

## Get stopped

The containers will store their node config file locally, so if you want from scratch, you should tell docker compose to remove volumes when taking down the containers.

    docker-compose down -v

## Files

Scripts:
- `create-cluster.sh`: Gets the IP addresses of the Redis Cluster containers and uses them to create the cluster by executing the create cluster command inside the `redis-1` container.
- `container-ips.sh`: Gets the IP addresses of the Redis Cluster containers. Useful for when you want to reconcile which Redis nodes with containers.
- `cluster-nodes.sh`: Get the Redis Cluser node list by running the cluster nodes command inside the `redis-1` container.

Redis:
- `redis.conf`: Redis configuration file, mounted into each container.

Docker:
- `docker-compose.yml`: Docker Compose configuration file.
