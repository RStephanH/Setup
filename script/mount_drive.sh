#!/usr/bin/bash

MOUNT_POINT="/mnt/ext4"
DEVICE="/dev/sdb1"

#Check if the device exists
if [ -e "$DEVICE" ];then 
	#Create the mount point if it doesn't exist 
	mkdir -p "$MOUNT_POINT"
	#Mount the device
	mount -o defaults,noatime,nofail "$DEVICE" "$MOUNT_POINT"
fi
