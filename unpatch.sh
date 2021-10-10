#!/bin/bash
path=services
patched=$(find $path -name \*.orig)
for i in $patched
do
originfile=$(echo $i|sed 's/\.orig$//g')
echo $originfile
rm $originfile>/dev/null 2>&1
mv "$i" "$originfile"
done
