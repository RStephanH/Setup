#!/bin/bash

echo "Before making any change let's create a backup the fstab file"

mkdir ~/backup
sudo cp /etc/fstab ~/backup/ 

sudo mkdir -p /mnt/docker/ /mnt/hdd_512/
sudo chown -R $USER:$USER /mnt/hdd_512/
sudo chown -R $USER:$USER /mnt/docker/

read -p "Enter the UUID of the docker partition" docker_UUID
read -p "Enter the UUID pf the storage partition" storage_UUID

docker_partition="$docker_UUID ext4 /mnt/docker default 0 0 1"
