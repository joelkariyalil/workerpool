.PHONY: build test format lint lint-fix

build:
	

test:
	@echo "\t Testing"
	@go test -timeout 30s ./...


format:
	@echo "\t Tidying"
	@go mod tidy
	
	@echo "\t Formatting"
	@go fmt ./...


lint:
	GOFLAGS=-buildvcs=false go tool -modfile=go.mod golangci-lint run


lint-fix:
	GOFLAGS=-buildvcs=false go tool -modfile=go.mod golangci-lint run --fix


update:
	@echo "\t Updating"
	@go get -u ./... && format

