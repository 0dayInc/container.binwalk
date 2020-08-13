#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "${apt} install -y lzma ${assess_update_errors}"
grok_error

$screen_cmd "/usr/bin/pip3 install pylzma ${assess_update_errors}"
grok_error
