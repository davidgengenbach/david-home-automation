#!/usr/bin/env bash

set -eux

if ! git status --porcelain; then
  echo "Can only run on clean git tree. Please commit and push all your changes. Exiting"
  exit 1
fi

# Increase version
poetry version patch
TAG=$(poetry version --short)

# Replace the version in the pip install command
sed -i -e "s|\(david-home-automation==\).*|\1$TAG|g" README.md

git add .
git commit -am "Bump version to $TAG"
git tag $TAG

git push
git push origin $TAG