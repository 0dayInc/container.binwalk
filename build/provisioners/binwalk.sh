#!/bin/bash --login
source /etc/profile.d/globals.sh

#$screen_cmd "${apt} install -y binwalk ${assess_update_errors}"
$screen_cmd "cd /opt && git clone https://github.com/ReFirmLabs/binwalk && cd /opt/binwalk && python3 setup.py install ${assess_update_errors}"
grok_error
