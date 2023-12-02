#!/bin/bash

VER=0.0.1-SNAPSHOT
IMAGE_NAME=demo-app
DOCKERHUB_USERNAME=k8loud
FULL_IMAGE_NAME=$DOCKERHUB_USERNAME/$IMAGE_NAME:$VER

# Build Docker image
echo "Building Docker image: $FULL_IMAGE_NAME"
docker build -t $FULL_IMAGE_NAME . --build-arg VER=$VER

if [ $? -eq 0 ]; then
    echo "Docker build successful"

    # Log in to Docker Hub
    docker login

    # Push Docker image to Docker Hub
    docker push $FULL_IMAGE_NAME

    # Check if Docker push was successful
    if [ $? -eq 0 ]; then
        echo "Docker push successful"
    else
        echo "Docker push failed"
        exit 1
    fi
else
    echo "Docker build failed"
    exit 1
fi