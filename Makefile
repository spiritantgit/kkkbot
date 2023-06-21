%.o : %.mod

APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ghcr.io/spiritantgit
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
OS=linux
TARGETARCH=amd64

get: 
	go get

format:
	gofmt -s -w ./

lint:
	golint

test: 
	go test -v
	
build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kkkbot -ldflags "-X="github.com/spiritantgit/kkkbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}:${VERSION}-${OS}-${TARGETARCH}

push:
	docker push ${REGISTRY}:${VERSION}-${OS}-${TARGETARCH}

clean: 
	rm -rf kkkbot

%.o : %.mod


