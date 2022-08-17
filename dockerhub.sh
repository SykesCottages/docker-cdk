#!/bin/bash

LATEST_VERSION=2

# Validate the container passes our tests
./test.sh

# You need to provide your own creds because #security
docker login

VERSIONS=( 1 2 )
for VERSION in "${VERSIONS[@]}"
do
  docker build --no-cache -t sykescottages/cdk:${VERSION} $VERSION
  docker push sykescottages/cdk:${VERSION}
  # Tagging latest version
  if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
    docker tag sykescottages/cdk:${VERSION} sykescottages/cdk:latest
    docker push sykescottages/cdk:latest
    docker rmi sykescottages/cdk:latest
  fi
  docker rmi sykescottages/cdk:${VERSION}
done
