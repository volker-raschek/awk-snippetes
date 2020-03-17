#!/bin/bash

for f in $(ls *.rpm); do
  new=$(rpm --query --info --package ./${f} | awk -F ':' -f rename-rpms.awk)
  printf "mv ${f} ${new}\n"
done