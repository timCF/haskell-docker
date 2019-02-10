#!/bin/bash

set -e

TODAY="$(date +%Y-%m-%d)"
DOCKERHUB_USER="tkachuklabs"

STACK_IMAGE="ubuntu-16.04-stack"
KETER_IMAGE_7_19="ubuntu-16.04-keter-lts-7.19"
KETER_IMAGE_12_20="ubuntu-16.04-keter-lts-12.20"
YESOD_IMAGE="ubuntu-16.04-yesod-lts-11.22"

STACK_TAG="$DOCKERHUB_USER/$STACK_IMAGE:$TODAY"
KETER_TAG_7_19="$DOCKERHUB_USER/$KETER_IMAGE_7_19:$TODAY"
KETER_TAG_12_20="$DOCKERHUB_USER/$KETER_IMAGE_12_20:$TODAY"
YESOD_TAG="$DOCKERHUB_USER/$YESOD_IMAGE:$TODAY"

docker push "$STACK_TAG"
docker push "$KETER_TAG_7_19"
docker push "$KETER_TAG_12_20"
docker push "$YESOD_TAG"

echo "$STACK_TAG push succeeded"
echo "$KETER_TAG_7_19 push succeeded"
echo "$KETER_TAG_12_20 push succeeded"
echo "$YESOD_TAG push succeeded"
