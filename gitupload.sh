#!/bin/sh
# @bencarpena 20210202

dt=$(date '+%Y%m%d_%H%M%S');
echo "$dt"

git add .
git commit -m $dt
git push origin main