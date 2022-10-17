FROM golang:1.17 as builder
LABEL maintainer="Stanislav Chesnovskii"

ARG GOOS=linux
ARG GOARCH=amd64

WORKDIR /hello-mr-badger
COPY main.go .
RUN go mod init github.com/chesnovskii/hello-mr-badger && CGO_ENABLED=0 GOOS=linux GOARCH=$GOARCH go build -a -installsuffix cgo -o hello-mr-badger .

FROM alpine:3.15.2
WORKDIR /usr/local/hello-mr-badger/
COPY --from=builder /hello-mr-badger/hello-mr-badger .

EXPOSE 8080
CMD ["./hello-mr-badger"]
