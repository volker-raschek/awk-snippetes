#!/bin/awk

function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }

BEGIN{
  origin = ""
  name = "";
  epoch = "0";
  version = "";
  release = "0";
}

{
  if (trim($1) == "Name") {
    name = trim($2);
  }
  if (trim($1) == "Epoch") {
    epoch = trim($2);
  }
  if (trim($1) == "Version") {
    version = trim($2);
  }
  if (trim($1) == "Release") {
    release = trim($2);
  }
  if (trim($1) == "Architecture") {
    arch = trim($2);
  }
}

END{
  printf "%s-%s:%s-%s.%s.rpm\n", name, epoch, version, release, arch;
}