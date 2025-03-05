#!/usr/bin/bash
tools=("ghostty","remmina","obs-studio","libvirtd","quemu","yakuake","wireshark","obsidian","telegram-desktop","thinderbird","virtual-box","cmake","kernel-devel")
for tool in "${tools[@]}"; do
    sudo pacman -S $tool
    if [ echo $? -eq 0 ];then
        echo $tool installed
    else
        echo "$tool not installed"
    fi
done