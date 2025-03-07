#!/usr/bin/bash
tools=("zapzap","onlyoffice-bin")
for tool in ${tools[@]}; do
    yay -Suy $tool --no-confirm
done