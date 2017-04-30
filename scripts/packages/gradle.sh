#!/bin/sh

if which gradle >/dev/null; then
  echo "skip gradle installation"
else
  echo "gradle installation"
  apt-get install -y gradle
fi

