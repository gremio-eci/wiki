#!/bin/bash

if ! [ -x "$(command -v hugo)" ]; then
  echo "Error: Must install 'hugo' before running this program."
  echo "Check the README.md"
  exit 1
fi

URL="http://127.0.0.1:1313/wiki/"

if [ -x "$(command -v xdg-open)" ]; then
  xdg-open "$URL"
elif [ -x "$(command -v gnome-open)" ]; then
  gnome-open URL
fi

hugo server -D -v --disableFastRender -b "$URL"
