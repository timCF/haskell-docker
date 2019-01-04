#!/bin/bash

set -e

if [ $# -ne 1 ]
  then
    echo "expected 1 argument which is ident of remote server (like root@myhost.com)"
    exit 1
fi

DESTINATION_IDENT="$1"

BUILD_DATE="2019-01-04"
DOCKERHUB_USER="tkachuklabs"
KETER_IMAGE="ubuntu-16.04-keter-lts-7.19"
KETER_TAG="$DOCKERHUB_USER/$KETER_IMAGE:$BUILD_DATE"

DUMMY_CONTAINER="$(cat /dev/urandom | base64 | tr -cd 'a-f0-9' | head -c 32)"

docker pull "$KETER_TAG"
mkdir -p ./artifacts
docker create -ti --name "$DUMMY_CONTAINER" "$KETER_TAG" bash
docker cp "$DUMMY_CONTAINER:/root/.local/bin/keter" ./artifacts/keter
docker rm -fv "$DUMMY_CONTAINER"

scp ./artifacts/keter "$DESTINATION_IDENT:~/"
scp ./private/install-keter.sh "$DESTINATION_IDENT:~/"
ssh "$DESTINATION_IDENT" '~/install-keter.sh'
ssh "$DESTINATION_IDENT" 'rm -rf ~/install-keter.sh'
ssh "$DESTINATION_IDENT" 'rm -rf ~/keter'

echo "keter successfully installed to $DESTINATION_IDENT"
