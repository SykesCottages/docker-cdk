#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled
LATEST_VERSION="2"

docker login >>/dev/null 2>&1

TAG="sykescottages/cdk:base"
docker manifest rm $TAG
docker manifest create $TAG \
  --amend "$TAG-amd64" \
  --amend "$TAG-arm64"
docker manifest push $TAG

VERSIONS=("1" "2")
for VERSION in "${VERSIONS[@]}"; do
  TAG="sykescottages/cdk:${VERSION}"
  docker manifest rm $TAG
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done

TAG="sykescottages/cdk:latest"
LATEST_TAG="sykescottages/cdk:$LATEST_VERSION"
docker manifest rm $TAG
docker manifest create $TAG \
  --amend "$LATEST_TAG-amd64" \
  --amend "$LATEST_TAG-arm64"
docker manifest push $TAG
