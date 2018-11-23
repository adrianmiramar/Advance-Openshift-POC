#!/usr/bin/env bash

echo "Creating new folder to /etc/ansible/inventory"
mkdir /etc/ansible/inventory
echo "Copy a new hosts file and variables file to /etc/ansible/inventory"
cp /root/ocp_advanced_deployment_homework/hosts/* /etc/ansible/inventory/

echo "Override envoroment vairables to generate the inventory"
GUID=`hostname|awk -F. '{print $2}'`

sed -i "s/GUID/$GUID/g" /etc/ansible/inventory/hosts
sed -i "s/INTERNAL/$INTERNAL/g" /etc/ansible/inventory/hosts

sed -i "s/GUID/$GUID/g" /etc/ansible/inventory/variables
sed -i "s/DOMAIN/$DOMAIN/g" /etc/ansible/inventory/variables
sed -i "s/INTERNAL/$INTERNAL/g" /etc/ansible/inventory/variables
sed -i "s/AUTH_USER/$AUTH_USER/g" /etc/ansible/inventory/variables
sed -i "s/AUTH_PASSWORD/$AUTH_PASSWORD/g" /etc/ansible/inventory/variables

echo "Modify /etc/ansible/ansible.cfg to use inventory dir as default"
sed -i "s|#inventory      = /etc/ansible/hosts|inventory       = /etc/ansible/inventory|g" /etc/ansible/ansible.cfg
