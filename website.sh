#!/bin/bash

# Author: Priyanshi Sarad
# Date Created: 10/2/2023

# Description:
# This script will host a website which I have taken from tooplate.com

# Usage:
# ./website.sh
# Also, don't forget to give the script execute permissions

# Installing httpd and dependencies.
echo "########################################"
echo "Updating the System and Installing Packages - httpd"
echo "########################################"
sudo yum update -y && yum upgrade -y > /dev/null
sudo yum install httpd wget unzip -y > /dev/null

echo "########################################"
echo "Start and Enable server"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd

echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir /tmp/website_data
cd /tmp/website_data
wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip > /dev/null
unzip 2129_crispy_kitchen.zip > /dev/null
sudo cp -r ./2129_crispy_kitchen/* /var/www/html/

echo "########################################"
echo "Restarting the Server"
echo "########################################"
sudo systemctl restart httpd

echo "########################################"
echo "CLEAN UP"
echo "########################################"
rm -rf /tmp/website_data

echo "Website is now ready"

