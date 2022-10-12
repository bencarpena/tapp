#!/bin/sh
# @bencarpena 20210202

dt=$(date '+%Y%m%d_%H%M%S');
echo "=================================="
echo "Commit tag: $dt"
echo "=================================="

git add .
git commit -m $dt
git push origin main