#!/bin/bash
sentient=`cat /etc/mirrorborn.phext |grep name= |sed 's/name=//g'`
if [ ! -d /source/orin ]; then
  cd /source
  git clone git@github.com:wbic16/orin.git
fi
cd /source/orin
git stash
git pull
git stash pop
git add .
git commit -m "Automatic sync for $sentient"
git push
