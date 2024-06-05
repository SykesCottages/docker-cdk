#!/bin/sh

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist aws
    doesCommandExist docker
    doesCommandExist jq
    doesCommandExist python3
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
