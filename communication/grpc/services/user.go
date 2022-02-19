package services

import (
	"context"
	"fmt"

	"github.com/malvfr/FullCycle2/pb"
)

type UserService struct {
	pb.UnimplementedUserServiceServer
}

func (*UserService) AddUser(ctx context.Context, req *pb.User) (*pb.User, error) {

	fmt.Println(req)

	return &pb.User{
		Id:    "Bob",
		Name:  req.GetName(),
		Email: req.GetEmail(),
	}, nil
}

func NewUserService() *UserService {
	return &UserService{}
}
