# front-end.dockerfile with Taskfile
FROM alpine:latest

RUN mkdir /app

# copy brokerApp executable from host to docker
COPY brokerApp /app

CMD [ "/app/brokerApp" ]