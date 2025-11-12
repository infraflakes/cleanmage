# Use git describe to get a version string.
# Example: v1.0.0-3-g1234567
# Fallback to 'dev' if not in a git repository.
VERSION ?= $(shell git describe --tags --always --dirty --first-parent 2>/dev/null || echo "dev")

# Go parameters
GO_CMD=go
GO_BUILD=$(GO_CMD) build
GO_FMT=$(GO_CMD) fmt
GO_CLEAN=$(GO_CMD) clean

# Binary name
BIN_NAME=cleanmage

# Build flags
LDFLAGS = -ldflags="-s -w -X main.version=$(VERSION)"

.PHONY: all build fmt clean lint

all: build

build: 
	mkdir -p build
	$(GO_BUILD) $(LDFLAGS) -o build/$(BIN_NAME) .

fmt:
	@echo "Formatting code..."
	$(GO_FMT) ./...

lint:
	golangci-lint run

clean:
	@echo "Cleaning..."
	$(GO_CLEAN)
	rm -rf build
