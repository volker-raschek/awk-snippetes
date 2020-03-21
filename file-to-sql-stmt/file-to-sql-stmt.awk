#!/bin/awk

function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); };
function es(s) { return gensub("'", "''", "g", s); }; # escape

BEGIN{
  columns[0] = "name";
  columns[1] = "surename";
  columns[2] = "birthday";
  columns[3] = "street";
  columns[4] = "zip";
  columns[5] = "city";
  columns[6] = "region";
  columns[7] = "country";
  printf "INSERT ALL\n";
}

{
  printf "  INTO mytable (%s, %s, %s, %s, %s, %s, %s, %s) VALUES ('%s', '%s', TO_DATE('YYYY-MM-DD', '%s'), '%s', '%s', '%s', '%s', '%s')\n",
    columns[0], columns[1], columns[2], columns[3], columns[4], columns[5], columns[6], columns[7],
    es(trim($1)), es(trim($2)), trim($3), es(trim($4)), es(trim($5)), es(trim($6)), es(trim($7)), es(trim($8));
}

END{
  printf "SELECT * FROM dual;\n"
}