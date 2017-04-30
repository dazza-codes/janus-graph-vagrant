#!/bin/sh

if which mvn >/dev/null; then
  echo "skip maven installation"
else
  echo "maven installation"
  apt-get install -y maven
fi

