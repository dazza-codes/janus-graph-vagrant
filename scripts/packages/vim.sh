#!/bin/sh

if which vim >/dev/null; then
  echo "skip vim installation"
else
  echo "vim installation"
  apt-get install -y vim
fi

