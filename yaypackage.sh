#!/usr/bin/bash
tools=("zapzap" "onlyoffice-bin" "zen-browser-bin" "varia" "brave-browser-bin")
for tool in ${tools[@]}; do
    echo "$tool"
    yay -Suy $tool --no-confirm

done
