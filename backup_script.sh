#!/bin/bash
# Author: Priyanshi Sarad
# Date Created: 8-10-2022
# Date Last Modified: 8-10-2022

# Description:
# This script will create a backup of the home directory of the current user and is going
# to store the backup in the current directory.
# You can change the value of BACKUP_DIR if you want to create the backup in some other directory.
# You can also set up a cron job to run this script automatically whenever you want to.

# Usage: ./backup_script
# or $PATH_OF_SCRIPT if you want to run this script from any directory that you want.


DATE="$(date +%d-%m-%Y)"
BACKUP_DIR=$PWD

echo
echo "Creating backup of $HOME inside $BACKUP_DIR"

# Write sudo before tar command if you want this to run as a root user.
# With &> I am deleting the STDERR and STDOUT by redirecting it to the /dev/null bit-bucket.
tar -czpvf "$BACKUP_DIR/backup-$DATE.tgz" "$HOME" &> /dev/null

echo
echo "Backup Completed Successfully !!"

exit 0
