#!/bin/sh

CDK_VERSION=1.192.0

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist cdk
}

itShouldMatchTheDesiredVersionOfCdk() {
    doesCdkMatchVersion $CDK_VERSION
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    fi
}

doesCdkMatchVersion() {
    VERSION=$(cdk --version|grep -i "$1")
    if [ -z "$VERSION" ]; then
      echo "Error: CDK version $1 is not found." >&2
      exit 1
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
itShouldMatchTheDesiredVersionOfCdk
