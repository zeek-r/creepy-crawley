#!/usr/bin/env bash

# Step 1: Linting
echo "Running ESLint..."
eslint .

# Step 2: Code complexity analysis
echo "Running complexity-report..."
npx complexity-report --threshold=30 --output=table $(find . -name '*.js' | grep -v 'node_modules')

# Step 3: Code style checks
echo "Running prettier..."
prettier --check '**/*.{js,json,md}'

# Step 4: Test coverage analysis if not done aleady, else remove
# echo "Running nyc..."
# nyc --reporter=text mocha
