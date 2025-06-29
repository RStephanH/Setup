#!/usr/bin/bash

CONFIG_FILE="/etc/docker/daemon.json"
DOCKER_DIR="/etc/docker/"
DOCKER_MOUNT_POINT="/mnt/docker"

# Check if the Docker directory exists
if [ -d "$DOCKER_DIR" ]; then
    # Create the daemon.json file if it doesn't exist
    sudo touch "$CONFIG_FILE"

    # Define the JSON configuration
    CONFIG='{
        "data-root": "/mnt/docker/docker/",
        "log-level": "info",
        "storage-driver": "overlay2"
    }'

    # Write the configuration to the file
    sudo bash -c "echo '$CONFIG' > $CONFIG_FILE"

    echo "Docker daemon configuration updated."
else
    echo "Docker directory does not exist."

    sudo mkdir -p /etc/docker/
    sudo chown $USER:$USER $DOCKER_MOUNT_POINT
    sudo touch "$CONFIG_FILE"
    # Define the JSON configuration
   
    CONFIG='{
        "data-root": "/mnt/docker/docker/",
        "log-level": "info",
        "storage-driver": "overlay2"
    }'

    # Write the configuration to the file
    sudo bash -c "echo '$CONFIG' > $CONFIG_FILE"

fi
