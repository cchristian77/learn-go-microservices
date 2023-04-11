# Dockerfile with Taskfile
FROM alpine:latest

RUN mkdir /app

# copy brokerApp executable from host to docker
COPY authApp /app

CMD [ "/app/authApp" ]