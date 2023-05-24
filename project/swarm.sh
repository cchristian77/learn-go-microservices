docker swarm init

# add a worker to the swarm
docker swarm join --token SOME_TOKEN

# add a manager to the swarm
docker swarm join-token manager

# get the token in the current worker
docker swarm join-token worker

# deploy docker swarm
cd project
docker stack deploy -c swarm.yml myapp

# list all running services
docker service ls

# Scaling services
# scale listener service to 3 instances up and running
docker service scale myapp_listener-service=3

# scale down
docker service scale myapp_listener-service=2

## Update service
cd logger-service

# create new version of the service
docker build -f logger-service.dockerfile -t urgood77/logger-service:1.0.1 .

# push to Docker Hub
docker push urgood77/logger-service:1.0.1

# scale up (no downtime)
docker service scale myapp_logger-service=2

# update image from 1.0.0 to 1.0.1
docker service update --image urgood77/logger-service:1.0.1 myapp_logger-service

# downgrade image from 1.0.0 to 1.0.1
docker service update --image urgood77/logger-service:1.0.0 myapp_logger-service

## Stop service

docker service scale myapp_broker-service=0

# stop the entire swarm
docker stack rm myapp

# leave the manager (worker node)
docker swarm leave --force

## Updating broker service
task build_broker
docker build -f broker-service.dockerfile -t urgood77/broker-service:1.0.1 .

# Push front-end image
docker build -f front-end.dockerfile -t urgood77/front-end:1.0.0 .

docker push urgood77/front-end:1.0.0