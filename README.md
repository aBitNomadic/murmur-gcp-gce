# murmur-gcp-gce
A murmur server designed for easy deployment to Google Cloud Platform:Google Compute Engine f1-micro

# Setup
1. Start a Google Compute Engine 
2. Select "Deploy a container image to this VM instance."
3. Use GCE GCE f1-micro container settings below. Replace (your username) in mount paths.
4. Edit murmur.ini in /home/(your username)/mumble with your settings
5. Restart your docker container

# Current GCE f1-micro container settings
```
Container image
abitnomadic/murmur-gcp-gce:latest

Container options
Restart policy	
Always
Run as privileged	
false
Allocate a buffer for STDIN	
false
Allocate a pseudo-TTY	
false

Command
not specified

Arguments
not specified

Environment variables
not specified

Host directory mounts
Mount path	Host path	Mode
/opt/mumble/data	/home/(your username)/mumble/	Read/write

Tmpfs mounts
not specified
```
# Contact
Please direct message on github
