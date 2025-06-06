#!/bin/bash

branches=("2025-q1" "2025-q2" "2025-q3")

for branch in "${branches[@]}";do
    git checkout $branch
    git pull origin $branch
    git merge master -m "merging with $branch"
done
    git checkout master