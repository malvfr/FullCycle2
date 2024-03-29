package main

import (
	"context"
	"fmt"
	"log"

	"github.com/malvfr/FullCycle2/pb"
	"google.golang.org/grpc"
)

func main() {
	conn, err := grpc.Dial("localhost:50051", grpc.WithInsecure())

	if err != nil {
		log.Fatalf("Could not connect to gRPC Server :%v", err)
	}

	defer conn.Close()

	client := pb.NewUserServiceClient(conn)
	AddUser(client)

}

func AddUser(client pb.UserServiceClient) {
	req := &pb.User{
		Id:    "0",
		Name:  "Bob",
		Email: "bob@bob.com",
	}

	res, err := client.AddUser(context.Background(), req)

	if err != nil {
		log.Fatalf("Could not make gRPC request : %v", err)
	}

	fmt.Println(res)

}
