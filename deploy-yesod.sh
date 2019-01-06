#!/bin/bash

set -e

if [ $# -ne 2 ]
  then
    echo "expected 2 arguments which are: name of Yesod project directory (like /Users/username/MYprojects/myservice) + ident of remote server (like root@myhost.com)"
    exit 1
fi

YESOD_PROJECT_SOURCE="$1"
DESTINATION_IDENT="$2"
BUILDER_IMAGE="tkachuklabs/ubuntu-16.04-yesod-lts-11.22:2019-01-06"
BUILDER_CONTAINER="$(cat /dev/urandom | base64 | tr -cd 'a-f0-9' | head -c 32)"
ARTIFACTS_DIR="$PWD/artifacts"
WORK_DIR="$ARTIFACTS_DIR/$BUILDER_CONTAINER"

mkdir -p "$ARTIFACTS_DIR"
cp -R "$YESOD_PROJECT_SOURCE" "$WORK_DIR"
rm -rf "$WORK_DIR/*.keter"

docker pull "$BUILDER_IMAGE"
docker run -it --rm \
  -v "$WORK_DIR:/root/$BUILDER_CONTAINER" \
  -w "/root/$BUILDER_CONTAINER" \
  "$BUILDER_IMAGE" \
  yesod keter

scp "$(ls $WORK_DIR/*.keter)" "$DESTINATION_IDENT:/opt/keter/incoming"
rm -rf "$WORK_DIR"

echo "$YESOD_PROJECT_SOURCE deployment to $DESTINATION_IDENT succeeded"
