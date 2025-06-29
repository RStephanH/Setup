
#!/usr/bin/bash

DOCKER_MOUNT_POINT="/mnt/docker"
STCK_MOUNT_POINT="mnt/ext4"

echo "Before making any change let's create a backup of the fstab file"

mkdir ~/backup
sudo cp /etc/fstab ~/backup/

sudo mkdir -p "$DOCKER_MOINT_POINT" "$STCK_MOUNT_POINT"
sudo chown -R $USER:$USER "$DOCKER_MOINT_POINT"
sudo chown -R $USER:$USER "$STCK_MOUNT_POINT"

read -p "Enter the UUID of the docker partition: " docker_UUID
read -p "Enter the UUID of the storage partition: " storage_UUID

docker_partition="UUID=$docker_UUID $DOCKER_MOUNT_POINT ext4 defaults 0 0"
storage_partition="UUID=$storage_UUID $STCK_MOUNT_POINT ext4 defaults 0 0"

echo "Adding the following lines to /etc/fstab:"
echo "$docker_partition"
echo "$storage_partition"

echo "$docker_partition" | sudo tee -a /etc/fstab
echo "$storage_partition" | sudo tee -a /etc/fstab

