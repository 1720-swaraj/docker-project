#!/bin/bash

# Define branches you want to merge master into
branches=("2025-q1" "2025-q2" "2025-q3")

for branch in "${branches[@]}"; do
  echo "Merging master into $branch"

  # Checkout target branch
  git checkout "$branch" || continue

  # Pull latest changes
  git pull origin "$branch"

  # Merge master into it
  git merge master -m "Merged master into $branch"

  # Push changes
  git push origin "$branch"
done

# Go back to master
git checkout master

