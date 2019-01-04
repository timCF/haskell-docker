#!/bin/bash

set -e

docker build -t tkachuklabs/ubuntu-16.04-ghc-8.2.2 -f ./Dockerfile-ubuntu-16.04-ghc-8.2.2 .
