# Redis Cluster Docker Quickstart

Creates 6 containers with associated volumes and attaches them to a single network so they can communicate.

Scripts provide simple way to get info about the Redis Cluster nodes.

Prerequisite: Docker and Docker Compose installed. Redis Docker images for Redis v5+.

## Get started

1. Create the containers, volumes and network using Docker Compose

        docker-compose up
   
   This will start outputting the logs into the terminal window

2. In a new terminal window, update the scripts to be executable

        chmod +x *.sh
        
3. Run the create cluster script

        ./create-cluster.sh
   
   You will need to enter 'yes' when prompted to accept the cluster configuration

You now have a Redis Cluster running!

## Get stopped

The containers will store their node config file locally, so if you want to start from scratch, you should tell docker compose to remove volumes when taking down the containers.

    docker-compose down -v
    
If you don't do this then new containers will pick up the old configuration files which will cause problems with the cluster.

## Files

Scripts:
- `create-cluster.sh`: Gets the IP addresses of the Redis Cluster containers and uses them to create the cluster by executing the create cluster command inside the `redis-1` container.
- `container-ips.sh`: Gets the IP addresses of the Redis Cluster containers. Useful for when you want to reconcile which Redis nodes with containers.
- `cluster-nodes.sh`: Get the Redis Cluser node list by running the cluster nodes command inside the `redis-1` container.

Redis:
- `redis.conf`: Redis configuration file, mounted into each container.

Docker:
- `docker-compose.yml`: Docker Compose configuration file.
