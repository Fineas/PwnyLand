#!/bin/bash
sudo docker run --cpuset-cpus="0-$(($(nproc)-1))" --rm --detach  --privileged -it  -e "TERM=xterm-256color" \
	--net=host \
	--hostname pwny_land \
	--name pwny_land_ubuntu \
	-v /mnt/c:/SHARED \
	pwny_land
echo "[+] Started"