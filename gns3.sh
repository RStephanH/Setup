#/bin/bash
dependecies=("qemu docker vpcs dynamips libvirt ubridge inetutils")
gns3=("gns3-server gns3-gui")
echo "let's install the dependecies first"
for dependecie in $dependecies; do
  echo "Package=$dependecie"
  yay -S $dependecie
done
echo "All dependecies are installed"
for packet in $gns3; do
  echo "Package=$packet"
  yay -S $packet
done
echo "Script finished"
