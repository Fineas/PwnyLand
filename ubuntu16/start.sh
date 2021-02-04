#!/bin/bash
sudo docker run --cpuset-cpus="0-$(($(nproc)-1))" --rm --detach  --privileged -it  -e "TERM=xterm-256color" \
	--net=host \
	--hostname pwny_land \
	--name u16 \
	-v c:/:/SHARED \
	u16
echo "[+] Started"