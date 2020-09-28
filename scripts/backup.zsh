#!/usr/bin/zsh

currentDate=$(date +%x-%X)

git add .
git commit -m  $currentDate
git push
