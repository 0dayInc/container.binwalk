#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "pip install nose ${assess_update_errors}"
grok_error
