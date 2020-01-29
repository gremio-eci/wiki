#!/bin/bash
hugo -D
git add public/
git commit -m "Publish"
git push origin master
