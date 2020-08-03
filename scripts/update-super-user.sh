#!/bin/sh

SPW="${SUPW}"

# Wait for the server to start
until pids=$(pidof murmur.x86)
do   
    sleep 1
done
#I just dont have a better answer
echo "Done waiting for murmur to start, Sleep for a few seconds to let it get set up"
sleep 3

/opt/mumble/murmur.x86 -ini /opt/mumble/data/murmur.ini -supw "$SPW"