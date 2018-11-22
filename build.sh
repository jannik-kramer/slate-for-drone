#!/bin/sh

if [ ! -d "$PLUGIN_SOURCE" ]; then
  echo Documentation source folder \'$PLUGIN_SOURCE\' does not exists
  exit 64
fi

if [ ! -d "$PLUGIN_TARGET" ]; then
  echo Documentation target folder \'$PLUGIN_TARGET\' does not exists
  exit 65
fi

cp -a $PLUGIN_SOURCE/. /usr/src/app/source

# need to be called in app dir but getting back to previous workdir can be tricky
# thus, sub-shell
(cd /usr/src/app; bundle exec middleman build --clean)

cp -a /usr/src/app/build/. $PLUGIN_TARGET
