#!/bin/sh
dt=$(date '+%Y%m%d_%H%M%S');
echo "$dt"

git add .
git commit -m $dt
git push origin main