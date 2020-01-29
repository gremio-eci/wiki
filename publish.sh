#!/bin/bash
hugo -D -d docs
git add docs/
git commit -m "Publish"
git push origin master
