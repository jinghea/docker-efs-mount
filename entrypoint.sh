#!/bin/sh


REGION=$(aws configure get region)

if [ "x${REGION}" != "x" ]; then
  sed -i "s/#region.*/region=${REGION}/g" /etc/amazon/efs/efs-utils.conf
fi

mount -t efs -o tls "${EFS_ID:invalid}" /mnt/
tail -f /dev/null