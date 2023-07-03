#!/bin/bash

VERSION=$1
LATEST_VERSION=$2

docker build --no-cache -t sykescottages/cdk:${VERSION} $VERSION
docker push sykescottages/cdk:${VERSION}
# Tagging latest version
if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
  docker tag sykescottages/cdk:${VERSION} sykescottages/cdk:latest
  docker push sykescottages/cdk:latest
  docker rmi sykescottages/cdk:latest
fi
docker rmi sykescottages/cdk:${VERSION}