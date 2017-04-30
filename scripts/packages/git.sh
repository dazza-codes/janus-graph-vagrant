#!/bin/sh

if which git >/dev/null; then
  echo "skip git installation"
else
  echo "git installation"
  apt-get install -y git git-doc git-man gitk
fi

