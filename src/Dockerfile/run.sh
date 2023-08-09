#!/bin/bash

export DOCKLE_LATEST=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
)
IMAGE_NAME=part4
TAG=new

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
goodwithtech/dockle:v${DOCKLE_LATEST} ${IMAGE_NAME}:${TAG}
