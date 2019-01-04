#!/bin/bash

set -e

TODAY="$(date +%Y-%m-%d)"
DOCKERHUB_USER="tkachuklabs"

STACK_IMAGE="ubuntu-16.04-stack"
KETER_IMAGE="ubuntu-16.04-keter-lts-7.19"
YESOD_IMAGE="ubuntu-16.04-yesod-lts-11.22"

STACK_TAG="$DOCKERHUB_USER/$STACK_IMAGE:$TODAY"
KETER_TAG="$DOCKERHUB_USER/$KETER_IMAGE:$TODAY"
YESOD_TAG="$DOCKERHUB_USER/$YESOD_IMAGE:$TODAY"

docker build -t "$STACK_TAG" -f "./Dockerfile-$STACK_IMAGE" .
docker build -t "$KETER_TAG" -f "./Dockerfile-$KETER_IMAGE" .
docker build -t "$YESOD_TAG" -f "./Dockerfile-$YESOD_IMAGE" .

echo "$STACK_TAG build succeeded"
echo "$KETER_TAG build succeeded"
echo "$YESOD_TAG build succeeded"
