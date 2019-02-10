#!/bin/bash

set -e

if [ $# -ne 1 ]
  then
    echo "expected 1 argument which is ident of remote server (like root@myhost.com)"
    exit 1
fi

DESTINATION_IDENT="$1"
# BUILDER_IMAGE="tkachuklabs/ubuntu-16.04-keter-lts-7.19:2019-01-06"
BUILDER_IMAGE="tkachuklabs/ubuntu-16.04-keter-lts-12.20:2019-02-10"
BUILDER_CONTAINER="$(cat /dev/urandom | base64 | tr -cd 'a-f0-9' | head -c 32)"
WORK_DIR="$PWD/artifacts/$BUILDER_CONTAINER"

mkdir -p "$WORK_DIR"
docker pull "$BUILDER_IMAGE"
docker create -ti --name "$BUILDER_CONTAINER" "$BUILDER_IMAGE" bash
docker cp "$BUILDER_CONTAINER:/root/.local/bin/keter" "$WORK_DIR/keter"
docker rm -fv "$BUILDER_CONTAINER"

scp "$WORK_DIR/keter" "$DESTINATION_IDENT:~/"
scp "$PWD/private/install-keter.sh" "$DESTINATION_IDENT:~/"
ssh "$DESTINATION_IDENT" '~/install-keter.sh'
ssh "$DESTINATION_IDENT" 'rm -rf ~/install-keter.sh'
ssh "$DESTINATION_IDENT" 'rm -rf ~/keter'
rm -rf "$WORK_DIR"

echo "keter successfully installed to $DESTINATION_IDENT"
