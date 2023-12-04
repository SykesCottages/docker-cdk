#!/bin/bash

ARCH=$(arch)

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

if [ "x86_64" == "$ARCH" ]; then
  ARCH=amd64
elif [ "aarch64" == "$ARCH" ]; then
  ARCH=arm64
else
  echo "Architecture ${ARCH} not supported."
  exit 1
fi

TAG="sykescottages/cdk:base-${ARCH}"
docker build --quiet --no-cache -t $TAG --build-arg ARCH=$ARCH base >> /dev/null 2>&1
docker push $TAG >> /dev/null 2>&1

VERSIONS=("1" "2")
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $ARCH >> /dev/null 2>&1 &
done

wait
