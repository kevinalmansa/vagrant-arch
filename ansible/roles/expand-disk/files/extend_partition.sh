#!/bin/bash

#
#   This bash script extends the last partition of the specified disk
#   To the maximum size available.
#
# Credit: https://unix.stackexchange.com/a/597142

# target disk
disk='sda'

# get last partition
part=$(grep  "${disk}" /proc/partitions | tail -1 | awk '{print $4}' | xargs)
partN=$(echo $part | tail -c 2)

# fdisk: delete and recreate the last partition with the largest size possible.
(
echo d # Delete partition
echo $partN # Last partition
echo n # Add a new partition
echo p # Primary partition
echo $partN # Last partition
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)
echo w # Write changes
) | fdisk /dev/$disk

# update filesystem to match new partition size
resize2fs /dev/$part
