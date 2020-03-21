#!/bin/bash

cat data.csv | awk -F '|' -f file-to-sql-stmt.awk