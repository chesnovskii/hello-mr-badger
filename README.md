# Hello-mr-badger

Simple http server application written in Go.

## Build

_Clone this repository_
```console
git clone https://github.com/chesnovskii/hello-mr-badger.git
```

### Using Makefile

_amd64 platform_
```console
make build
```

_arm64 platform_
```console
make build-arm
```

### Manually

```console
docker build -t $IMAGE_NAME:$IMAGE_TAG --platform $IMAGE_PLATFORM .
```

## Run

### Using Makefile

_amd64 platform_
```console
make run
```

_arm64 platform_
```console
make run-arm
```

### Manually

```console
docker run -ti --name $APP_NAME -p 8080:8080 $IMAGE_NAME:$IMAGE_TAG
```

## Usage examples

```console
curl -i http://localhost:8080/
HTTP/1.1 200 OK

Mr. Badger greetings you!
```

```console
curl -i http://localhost:8080/mr-badger/ping
HTTP/1.1 200 OK

{"time":"2022-10-17 7:7:47.157459722","service":{"name":"mr-badger","version":"1.0.0","type":"backend"},"status":{"code":0}}
```

```console
curl -s -i http://localhost:8080/mr-badger/alive
HTTP/1.1 200 OK
```