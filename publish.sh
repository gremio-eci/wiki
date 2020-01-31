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

if [ "$(git stash)" == "No local changes to save" ]; then
  STASHED=false
else
  STASHED=true
fi

git checkout gh-pages
git reset --hard master

hugo -D -v

if [ $? -ne 0 ]; then
  echo "Hugo failed to run, aborting publishing"
else
  mkdir tmp 2> /dev/null
  mv * tmp/ 2> /dev/null
  mv .* tmp/ 2> /dev/null
  mv tmp/public/* . 2> /dev/null
  mv tmp/.git . 2> /dev/null
  rm -rf tmp 2> /dev/null
  git add -A
  git commit -m "Publish"
  git push origin gh-pages -f
fi

git checkout master

if [ "$STASHED" == true ]; then
  git stash apply
fi
