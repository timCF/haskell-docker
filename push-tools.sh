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

docker push "$STACK_TAG"
docker push "$KETER_TAG"
docker push "$YESOD_TAG"

echo "$STACK_TAG push succeeded"
echo "$KETER_TAG push succeeded"
echo "$YESOD_TAG push succeeded"
