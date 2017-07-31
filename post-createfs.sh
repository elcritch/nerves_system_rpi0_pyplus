#!/bin/sh

set -e

echo "STARDEBUG:::1 Unzipping empty.ext4 file and printing env variables"
env
echo "DONEDEBUG:::1 "

echo "STARDEBUG:::2 ls target vars"
echo TARGET_DIR: $TARGET_DIR
ls -lh $TARGET_DIR

echo BR2_EXTERNAL_NERVES_PATH: $BR2_EXTERNAL_NERVES_PATH
ls -lh $BR2_EXTERNAL_NERVES_PATH
echo "DONEDEBUG:::2 "


unzip -o -d $NERVES_DEFCONFIG_DIR/assets $NERVES_DEFCONFIG_DIR/assets/empty.ext4.zip
mv $NERVES_DEFCONFIG_DIR/assets/empty.ext4 $BINARIES_DIR/empty.ext4

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
