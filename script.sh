# Building Microservices

## Login to Docker Hub
docker login

### Broker Service
cd broker-service

# Build docker image
docker build -f broker-service.dockerfile -t urgood77/broker-service:1.0.0 .

# Push docker image to Docker Hub
docker push urgood77/broker-service:1.0.0

### Logger Service
cd logger-service

# Build docker image
docker build -f logger-service.dockerfile -t urgood77/logger-service:1.0.0 .

# Push docker image to Docker Hub
docker push urgood77/logger-service:1.0.0

### Authentication Service
cd authentication-service

# Build docker image
docker build -f authentication-service.dockerfile -t urgood77/authentication-service:1.0.0 .

# Push docker image to Docker Hub
docker push urgood77/authentication-service:1.0.0

### Listener Service
cd listener-service

# Build docker image
docker build -f listener-service.dockerfile -t urgood77/listener-service:1.0.0 .

# Push docker image to Docker Hub
docker push urgood77/listener-service:1.0.0

### Mail Service
cd mail-service

# Build docker image
docker build -f mail-service.dockerfile -t urgood77/mail-service:1.0.0 .

# Push docker image to Docker Hub
docker push urgood77/mail-service:1.0.0