#!/usr/bin/env bash

set -eux

if ! git status --porcelain; then
  echo "Can only run on clean git tree. Please commit and push all your changes. Exiting"
  exit 1
fi

# Increase version
poetry version patch
TAG=$(poetry version --short)

git add .
git commit -am "Bump version to $TAG"
git tag $TAG
git push
git push origin $TAG