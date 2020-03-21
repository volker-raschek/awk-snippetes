#!/bin/bash

docker run \
  --rm \
  --volume $(pwd):/workspace \
  --workdir /workspace \
    centos:centos7 \
      ./file-to-sql-stmt.sh