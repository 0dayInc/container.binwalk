#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "/usr/bin/pip install pylzma ${assess_update_errors}"
grok_error
