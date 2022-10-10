#!/bin/bash

# Author: Priyanshi Sarad
# Date Created: 10-10-2022
# Date Last Modified: 10-10-2022

# Description:
# This script will update and upgrade the Ubuntu Linux Server and also reboot when required.

# Usage:
# ./system_update.sh

echo -e '\033[0;32mStep-1 :: Updating the system \033[0m'
apt-get update
echo

echo -e '\033[0;32mStep-2 :: Upgrading the system \033[0m'
apt-get upgrade -y
echo

echo -e '\033[0;32mStep-3 :: Removing Unused Packages \033[0m'
apt-get --purge autoremove
echo

echo -e '\033[0;32mStep-4 :: Clean Up \033[0m'
apt-get autoclean
echo

if [ -f /var/run/reboot-required ]; then
	echo -e '\033[0;32mSystem Rebooting Now \033[0m'
	reboot
fi
exit 0
