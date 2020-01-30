#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  echo "Error: Must install 'git' before running this program."
  echo "Check the README.md"
  exit 1
fi

if ! [ -x "$(command -v hugo)" ]; then
  echo "Error: Must install 'hugo' before running this program."
  echo "Check the README.md"
  exit 1
fi

git stash
git checkout gh-pages
git reset --hard master

hugo -D -v

mkdir tmp
mv * tmp/
mv .* tmp/
mv tmp/public/* .
mv tmp/.git .
rm -rf tmp

git add -A
git commit -m "Publish"
git push origin gh-pages -f

git checkout master
git stash apply
