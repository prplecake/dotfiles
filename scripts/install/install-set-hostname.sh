#!/usr/bin/env bash

echo "==== Setting hostname ===="

ROOTDIR=$(cd "$(dirname "$0")/.." && pwd)

source "$ROOTDIR/_helpers"

get_hostname() {
	read -p "Enter new hostname: " hostname
}
get_hostname
correct=0
while [ !$correct ]; do
	echo "New hostname is $hostname"
	confirm "Is that correct?" && correct=1
	if [[ $correct == 1 ]]; then break; else get_hostname; fi
done

sudo hostname $hostname
echo $hostname | sudo tee /etc/hostname
# Backup hosts file just in case
sudo cp /etc/hosts /etc/hosts.bak
sudo sed -i "s/^127\.0\.0\.1.*$/127\.0\.0\.1	localhost	$hostname/" /etc/hosts

touch "$ROOTDIR/install/set_hostname"