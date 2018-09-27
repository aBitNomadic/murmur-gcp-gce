#!/bin/sh

if [ ! -f /opt/mumble/murmur.ini ]
then
  tar -xjvf /${MUMBLE_FILE} --strip-components=1 -C /opt/mumble
  chown -R mumble:mumble /opt/mumble
  echo Changing murmur run user to mumble
  sed -i 's/#uname=/uname=mumble/g' /opt/mumble/murmur.ini
  echo Extracted mumble server. Please edit murmur.ini and restart container/server.
fi

echo Server starting
/opt/mumble/murmur.x86 -fg -ini /opt/mumble/murmur.ini
