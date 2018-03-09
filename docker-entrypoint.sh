#!/bin/bash
cd /opt/SoapUI/projects
for file in $(ls $dir)
do
    [ -f $file ] && echo "$file is File"
    [ -d $file ] && echo "$file is Directory"
done
exec "$@"