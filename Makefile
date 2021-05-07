GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
BINARY_NAME=pwd-cli

all: clean build run
build:
	$(GOBUILD) -v -o $(BINARY_NAME) -i pwd-cli.go
run:
	echo 'Please modify and use pwd-cli.sh'
	./$(BINARY_NAME)
clean:
	$(GOCLEAN)
