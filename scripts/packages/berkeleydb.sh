#!/bin/sh

LIBDB_VER=5.3

if [ -f /usr/lib/x86_64-linux-gnu/libdb-${LIBDB_VER}.so ]; then
  echo "skip berkeleyDB installation"
else
  echo "berkeleyDB installation"
  apt-get install -y libdb${LIBDB_VER} libdb${LIBDB_VER}-java
fi

