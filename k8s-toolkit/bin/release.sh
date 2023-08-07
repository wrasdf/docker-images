#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo
  echo "usage: release.sh <ImageTag>"
  echo "  ie. ./bin/release.sh v1.3.0"
  exit 255
fi

APP_TAG=${1}
APP_TAG=${APP_TAG} docker-compose build k8s-toolkit
APP_TAG=${APP_TAG} docker-compose push k8s-toolkit
