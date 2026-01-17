#!/bin/bash

# Set your GitHub username
GITHUB_USERNAME="${GITHUB_USERNAME:-itsam77}"

# Use environment variable for token (don't hardcode!)
# Set this before running: export GITHUB_TOKEN=ghp_xxxxx
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    echo "Please run: export GITHUB_TOKEN=your_token"
    exit 1
fi

# Build image
docker build -t karsajobs-ui:latest .

# Tag image
docker tag karsajobs-ui:latest ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest

# Login and push
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin
docker push ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest

echo "✅ Image pushed to ghcr.io/$GITHUB_USERNAME/karsajobs-ui:latest"
