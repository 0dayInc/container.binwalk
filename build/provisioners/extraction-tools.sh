#!/bin/bash --login
source /etc/profile.d/globals.sh

# Binwalk relies on multiple external utilties in order to automatically extract/decompress files and data
$screen_cmd "${apt} install -y unrar unzip mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools sleuthkit default-jdk lzop srecord firmware-mod-kit forensics-extra ${assess_update_errors}"
grok_error

$screen_cmd "ln -sf /opt/firmware-mod-kit/trunk/src/cramfs-2.x/cramfsck /usr/local/bin/cramfsck  ${assess_update_errors}"
grok_error

# Install sasquatch to extract non-standard SquashFS images
$screen_cmd "${apt} install -y zlib1g-dev lzma liblzma-dev liblzo2-dev ${assess_update_errors}"
grok_error

# $screen_cmd "cd /opt && git clone https://github.com/devttys0/sasquatch && cd /opt/sasquatch && ./build.sh ${assess_update_errors}"
# grok_error

# Install jefferson to extract JFFS2 file systems
$screen_cmd "pip install cstruct ${assess_update_errors}"
grok_error

$screen_cmd "cd /opt && git clone https://github.com/sviehb/jefferson && cd /opt/jefferson && python3 setup.py install ${assess_update_errors}"
grok_error

# Install ubi_reader to extract UBIFS file systems
$screen_cmd "${apt} install -y liblzo2-dev python3-lzo ${assess_update_errors}"
grok_error

$screen_cmd "cd /opt && git clone https://github.com/jrspruitt/ubi_reader && cd /opt/ubi_reader && python3 setup.py install ${assess_update_errors}"
grok_error

# Install yaffshiv to extract YAFFS file systems
$screen_cmd "cd /opt && git clone https://github.com/devttys0/yaffshiv && cd /opt/yaffshiv && python3 setup.py install ${assess_update_errors}"
grok_error

# Install unstuff (closed source) to extract StuffIt archive files
$screen_cmd "mkdir /opt/stuffit && cd /opt/stuffit && wget http://downloads.tuxfamily.org/sdtraces/stuffit520.611linux-i386.tar.gz && tar -xzvf stuffit520.611linux-i386.tar.gz && cp /opt/stuffit/bin/unstuff /usr/local/bin/ ${assess_update_errors}"
grok_error
