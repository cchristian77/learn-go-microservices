package main

import (
	"context"
	"go-microservices/logger/data"
	"log"
	"time"
)

// RPCServer is the type for our RPC Server. Methods that take this as a receiver ara available
// over RPC, as long as they are exported.
type RPCServer struct{}

// RPCPayload is the struct type for data received from RPC
type RPCPayload struct {
	Name string
	Data string
}

// LogInfo writes payload to mongo
func (r *RPCServer) LogInfo(payload RPCPayload, resp *string) error {
	collection := client.Database("logs").Collection("logs")
	_, err := collection.InsertOne(context.TODO(), data.LogEntry{
		Name:      payload.Name,
		Data:      payload.Data,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	})

	if err != nil {
		log.Println("error writing to mongo", err)
		return err
	}

	*resp = "Processed payload via RPC:" + payload.Name
	return nil
}
