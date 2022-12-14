#!/bin/bash

LATEST_VERSION=2

# Validate the container passes our tests
./test.sh

if [ $? -ne 0 ]; then
  echo "Tests failed: Cannot build and push images, please fix the errors."
  exit 1
fi

# You need to provide your own creds because #security
docker login

docker build --no-cache -t sykescottages/cdk:base base
docker push sykescottages/cdk:base

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
