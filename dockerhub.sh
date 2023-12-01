#!/bin/bash

LATEST_VERSION=2

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

./build-base.sh >> /dev/null 2>&1

wait

VERSIONS=( 1 2 )
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $LATEST_VERSION >> /dev/null 2>&1 &
done

wait
