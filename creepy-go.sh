#!/bin/bash

# Step 1: Linting
echo "Running golint..."
golint ./...

# Step 2: Code complexity analysis
echo "Running gocyclo..."
gocyclo -over 15 $(find . -name '*.go' | grep -v 'vendor')

# Step 3: Code style checks
echo "Running gofmt..."
unformatted=$(gofmt -l $(find . -name '*.go' | grep -v 'vendor'))
if [ -n "$unformatted" ]; then
  echo "The following files need to be formatted with gofmt:"
  echo "$unformatted"
  exit 1
fi

# Step 4: Test coverage analysis, if not done in CI already or remove this
# echo "Running go test..."
# go test -cover ./...
