#!/usr/bin/bash

CONFIG_FILE="/etc/docker/daemon.json"
DOCKER_DIR="/etc/docker/"

# Check if the Docker directory exists
if [ -d "$DOCKER_DIR" ]; then
    # Create the daemon.json file if it doesn't exist
    sudo touch "$CONFIG_FILE"

    # Define the JSON configuration
    CONFIG='{
        "data-root": "/mnt/sdb2/docker/",
        "log-level": "info",
        "storage-driver": "overlay2"
    }'

    # Write the configuration to the file
    sudo bash -c "echo '$CONFIG' > $CONFIG_FILE"

    echo "Docker daemon configuration updated."
else
    echo "Docker directory does not exist."
fi
