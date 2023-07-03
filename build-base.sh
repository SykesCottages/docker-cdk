#!/bin/bash

docker build --no-cache -t sykescottages/cdk:base base
docker push sykescottages/cdk:base
