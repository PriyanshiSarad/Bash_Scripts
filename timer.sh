#!/bin/bash

# Author: Priyanshi Sarad
# Date Created: 9-10-2022
# Date Last Modified: 9-10-2022

# Description:
# This script takes minutes and seconds as options and then calculates total seconds
# and then this timer counts down till the time is up.

# Usage: ./timer.sh -m 1 -s 30
# or ./timer.sh -m 1
# or ./timer.sh -s 60

while getopts "m:s:" opt;
do
	case "$opt" in
		m) total_seconds=$(($OPTARG * 60));;
		s) total_seconds=$(($total_seconds + $OPTARG));;
		\?) ;;
	esac
done

while [ $total_seconds -gt 0 ]; 
do
	echo "$total_seconds"
	sleep 1s
	total_seconds=$(($total_seconds - 1))
done

echo "Times UP !!"
exit 0
