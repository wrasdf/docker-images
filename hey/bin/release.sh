#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo
  echo "usage: release.sh <ImageTag>"
  echo "  ie. release.sh v0.1.4"
  exit 255
fi

APP_TAG=${1}
APP_TAG=${APP_TAG} docker-compose build hey
APP_TAG=${APP_TAG} docker-compose push hey
