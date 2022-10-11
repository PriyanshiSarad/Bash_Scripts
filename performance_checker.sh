#!/bin/bash
# Author: Priyanshi Sarad
# Date Created: 11-10-2022
# Date Last Modified: 11-10-2022

# Description:
# This script logs the performance of the server in the performance.log file.

# Usage: ./performance_checker.sh

# Logging the timestamp with date command 
echo -e "1 -- This is the current timestamp of this server -->> $(date) \n" >> ~/performance.log


# Logging whether internet is connected or not
ping -c 1 google.com  &> /dev/null

if [ "$?" -eq 0 ]; then
	echo -e "2 -- Connectiviy -->> Internet Connected \n" >> ~/performance.log
else
	echo -e "2 -- Connectiviy -->> Internet not Connected \n" >> ~/performance.log
fi

# Logging the Memory Usage of the server
echo "3 -- Memory Usage:: " >> ~/performance.log
free -h | grep "Mem" >> ~/performance.log 

# Logging the Swap Usage of the server
echo -e "\n4 -- Swap Usage:: " >> ~/performance.log
free -h | grep "Swap" >> ~/performance.log 

# Logging the Disk Usage of the server
echo -e "\n5 -- Disk Usage:: " >> ~/performance.log
df -h >> ~/performance.log 

exit 0
