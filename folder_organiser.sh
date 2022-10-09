#!/bin/bash

# Author: Priyanshi Sarad
# Date Created: 9-10-2022
# Date Last Modified: 9-10-2022

# Description:
# Organise the files within a given folder into different subolders based on their file types.

# Usage: ./folder_organiser.sh


read -r -p "Which folder do you want to organise: " folder
while read file;
do
	case "$file" in
		*.jpg|*.jpeg|*.png) subfolder="images" ;;
		*.doc|*.docx|*.txt|*.pdf) subfolder="documents" ;;
		*.xls|*.xlsx|*.csv) subfolder="spreadsheet" ;;
		*.sh) subfolder="scripts" ;;
		*.zip|*.tar|*.tar.gz|*.tgz|*.tar.bz2) subfolder="archives" ;;
		*.ppt|*.pptx) subfolder="presentations" ;;
		*.mp3) subfolder="audio" ;;
		*.mp4)subfolder="video" ;;
		*) subfolder="." ;;
	esac

	if [ ! -d "$folder/$subfolder" ]; then
		mkdir "$folder/$subfolder"
	fi

	mv  "$folder/$file" "$folder/$subfolder"

done < <(ls "$folder")
exit 0
