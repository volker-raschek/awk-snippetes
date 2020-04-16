#!/bin/bash

CURRENT_FOLDER=${PWD}
FOLDER=/var/cache/rpm-distributor/workspace

cd ${FOLDER}

for f in $(ls *.rpm); do
  new=$(rpm --query --info --package ${f} | awk -F ':' -f rename-rpms.awk)
  mv ${f} ${new}
done

cd ..
createrepo .
cd ${CURRENT_FOLDER}