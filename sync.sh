#!/bin/bash
sentient=`cat /etc/mirrorborn.phext |grep name= |sed 's/name=//g'`
git stash
git pull
git stash pop
git add .
git commit -m "Automatic sync for $sentient"
git push
