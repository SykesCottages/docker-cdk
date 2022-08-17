#!/bin/bash

VERSIONS=( 1 2 )
for VERSION in "${VERSIONS[@]}"
do
  docker-compose -f $VERSION/docker-compose.test.yml build --no-cache && \
    docker-compose -f $VERSION/docker-compose.test.yml run --rm sut
done
