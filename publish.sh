#!/bin/bash
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
