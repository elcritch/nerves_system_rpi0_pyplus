#!/bin/sh

set -e

unzip -o -d $NERVES_DEFCONFIG_DIR/assets $NERVES_DEFCONFIG_DIR/assets/empty.ext4.zip

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
