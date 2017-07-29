#!/bin/sh

if mount | grep -q "/dev/mmcblk0p3";
then
  echo "Found provision filesystem"
else
  echo "Format provision filesystem"
  mkfs -t ext4 /dev/mmcblk0p3
  REBOOT=true
fi

if mount | grep -q "/dev/mmcblk0p4";
then
  echo "Found provision filesystem"
else
  echo "Format provision filesystem"
  mkfs -t ext4 /dev/mmcblk0p3
  REBOOT=true
fi

if [ ! -z $REBOOT ];
then
  echo "Rebooting";
  reboot
fi
