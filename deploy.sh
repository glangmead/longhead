#!/bin/bash

set -e
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Commit message, shared by both repos.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Commit and push the public/ submodule FIRST. It must go out before the
# source repo, otherwise the gitlink committed below would point at last
# run's public/ commit instead of the build we just made.
cd public
git add .
if ! git diff --cached --quiet; then
  git commit -m "$msg"
  git push origin master
else
  echo "No changes in public/, skipping commit."
fi
cd ..

# Commit and push the source repo, including the now-updated public/ gitlink.
git add .
if ! git diff --cached --quiet; then
  git commit -m "$msg"
  git push origin master
else
  echo "No changes in source repo, skipping commit."
fi
