#!/bin/sh

SPW="${SUPW}"

# Wait for the server to start
until pids=$(pidof murmur.x86)
do   
    sleep 1
done

/opt/mumble/murmur.x86 -supw "$SPW"