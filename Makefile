VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

format:
	gofmt -s -w ./

build: 
	go build -v -o kkkbot -ldflags "-X="github.com/spiritantgit/kkkbot/cmd.appVersion=${VERSION}