#!/bin/sh

SPW="${SUPW}"

if [ ! -f /opt/mumble/data/murmur.ini ]
then
  tar -xjvf /${MUMBLE_FILE} --strip-components=1 -C /opt/mumble
  mv /opt/mumble/murmur.ini /opt/mumble/data/murmur.ini
  chown -R mumble:mumble /opt/mumble
  echo Changing murmur run user to mumble
  sed -i 's/#uname=/uname=mumble/g' /opt/mumble/data/murmur.ini
  echo Extracted mumble server. Please edit murmur.ini and restart container/server.
fi

echo Server starting
if [ ! -z "$SPW" ]
then
  #im not proud of this, if anyones got a better idea please let me know
  /opt/mumble/murmur.x86 -fg -ini /opt/mumble/data/murmur.ini &
  /opt/mumble/murmur.x86 -supw "$SPW" &
  fg %-
else
  /opt/mumble/murmur.x86 -fg -ini /opt/mumble/data/murmur.ini
fi