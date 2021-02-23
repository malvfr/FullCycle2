FROM golang:alpine AS build

WORKDIR /Projects/Go

COPY . /Projects/Go

RUN GOOS=linux go build main.go

FROM scratch

WORKDIR /Projects/Go

COPY --from=build /Projects/Go .

CMD [ "./main" ]
