#!/bin/bash

associativities=$1
cache_sizes=${2:-"65536 131072 262144 524288 1048576 2097152"}
filename="exp.cfg"

for a in $associativities;
do
  for c in $cache_sizes;
  do
      echo current associativity "$a" cache size "$c"
      cp "c.cfg" "$filename"
      echo "-size (bytes) $c" >> "$filename"
      echo "-associativity $a" >> "$filename"
      ./cacti -infile "$filename" | tee -a ./scripts/res.log
  done
done

