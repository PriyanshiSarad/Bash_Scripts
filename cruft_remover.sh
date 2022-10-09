#!/bin/bash

# Author: Priyanshi Sarad
# Date Created: 9-10-2022
# Date Last Modified: 9-10-2022

# Description:
# This script removes all unmodified cruft files from the directory mentioned by the user.

# Usage:
# ./cruft_remover.sh 

read -p "Mention the directory from which you want to remove all the cruft files: " dir
read -p "Mention the number of days since the files you want to remove are last modified: " days

readarray -t arr < <(find "$dir" -maxdepth 1 -type f -mtime "+$days" )

for file in "${arr[@]}";
do
	rm -i "$file"
done

exit 0
