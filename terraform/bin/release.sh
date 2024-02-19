#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo
  echo "usage: ./bin/release.sh <ImageTag>"
  echo "  ie. ./bin/release.sh v0.1.0"
  exit 255
fi

# docker-compose build tf
# docker-compose push tf

APP_TAG=${1}
APP_TAG=${APP_TAG} docker-compose build tf
APP_TAG=${APP_TAG} docker-compose push tf
