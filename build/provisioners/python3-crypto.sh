#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "${apt} install -y python3-cryptography python3-pycryptodome ${assess_update_errors}"
grok_error
