#!/bin/bash

branches=("master" "2025-q1" "2025-q2" "2025-q3")

for branch in "${branches[@]}";do
    echo "checking out branches"
    git checkout $branch
    git add *
    git commit -m "$branch added"
    git push origin $branch
done

    git checkout master
