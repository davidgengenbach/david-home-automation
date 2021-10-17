#!/usr/bin/env bash

set -eux

# Increase version
poetry version patch

git add .
git commit -am "Bump version to $TAG"
git push

TAG = $(poetry version --short)
git tag $TAG
git push origin $TAG