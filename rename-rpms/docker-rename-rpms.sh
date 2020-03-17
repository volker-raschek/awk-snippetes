#!/bin/bash

docker run \
  --rm \
  --volume $(pwd):/workspace \
  --workdir /workspace \
    centos:centos7 \
      ./test.sh