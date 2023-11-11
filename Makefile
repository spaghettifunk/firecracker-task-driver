MAIN_PACKAGE_PATH := ./main.go
BINARY_NAME := firecracker-task-driver
BIN_OUTPUT_FOLDER := ./bin

.PHONY: tidy
tidy:
	go fmt ./...
	go mod tidy -v

.PHONY: build
build:
	GOARCH=amd64 GOOS=linux go build -o $(BIN_OUTPUT_FOLDER)/$(BINARY_NAME)-linux $(MAIN_PACKAGE_PATH)	

.PHONY: run
run: 		
	go run $(MAIN_PACKAGE_PATH) $(command)

.PHONY: test
test:
	go test -v -race -buildvcs ./...

.PHONY: test_coverage
test_coverage:
	go test ./... -coverprofile=coverage.out

.PHONY: clean
clean:
	go clean
	rm $(BIN_OUTPUT_FOLDER)/$(BINARY_NAME)-linux
