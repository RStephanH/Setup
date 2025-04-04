
#!/bin/bash

echo "Before making any change let's create a backup of the fstab file"

mkdir ~/backup
sudo cp /etc/fstab ~/backup/

sudo mkdir -p /mnt/docker /mnt/hdd_512
sudo chown -R $USER:$USER /mnt/hdd_512/
sudo chown -R $USER:$USER /mnt/docker/

read -p "Enter the UUID of the docker partition: " docker_UUID
read -p "Enter the UUID of the storage partition: " storage_UUID

docker_partition="UUID=$docker_UUID /mnt/docker ext4 defaults 0 0"
storage_partition="UUID=$storage_UUID /mnt/hdd_512 ntfs-3g defaults 0 0"

echo "Adding the following lines to /etc/fstab:"
echo "$docker_partition"
echo "$storage_partition"

echo "$docker_partition" | sudo tee -a /etc/fstab
echo "$storage_partition" | sudo tee -a /etc/fstab

