VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux

run: go get

format:
	gofmt -s -w ./

lint:
	golint

test: go test -v

build: 
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kkkbot -ldflags "-X="github.com/spiritantgit/kkkbot/cmd.appVersion=${VERSION}

clean: 
	rm -rf kkkbot