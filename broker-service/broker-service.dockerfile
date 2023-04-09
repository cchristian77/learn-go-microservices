# bage go image
FROM golang:1.19-alpine as builder

RUN mkdir /app

# copy current folder to /app
COPY . /app

WORKDIR /app

# Not using any C libraries
# build broker-service app
RUN CGO_ENABLED=0 go build -o brokderApp ./cmd/api

# add executable flag
RUN chmod +x /app/brokerApp

# Build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brokerApp /app

CMD [ "app/brokerApp" ]