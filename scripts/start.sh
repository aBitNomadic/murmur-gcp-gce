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
else
  tar -xjvf /${MUMBLE_FILE} --strip-components=1 -C /opt/mumble
  chown -R mumble:mumble /opt/mumble
fi

if [ ! -z "$SPW" ]
then
  echo "Updating Superuser password"
  /tmp/update-super-user.sh &
fi

echo Server starting
/opt/mumble/murmur.x86 -fg -ini /opt/mumble/data/murmur.ini