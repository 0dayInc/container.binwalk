#!/bin/bash --login
source /etc/profile.d/globals.sh

echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" | tee -a /etc/apt/sources.list
apt update
apt install -y apt-utils
apt install -y screen

$screen_cmd "${apt} install -y dialog ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y python ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y python-pip ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y python3 ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y python3-pip ${assess_update_errors}"
grok_error

$screen_cmd "${apt} update ${assess_update_errors}"
grok_error

$screen_cmd "${apt} dist-upgrade -y ${assess_update_errors}"
grok_error

$screen_cmd "${apt} full-upgrade -y ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y sudo ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y curl ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y gnupg2 ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y openssh-server ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y net-tools ${assess_update_errors}"
grok_error

$screen_cmd "${apt} install -y apt-file ${assess_update_errors}"
grok_error

$screen_cmd "service ssh start ${assess_update_errors}"
grok_error

$screen_cmd "useradd -m -s /bin/bash admin ${assess_update_errors}"
grok_error

$screen_cmd "usermod -aG sudo admin ${assess_update_errors}"
grok_error

$screen_cmd "chmod 700 /home/admin ${assess_update_errors}"
grok_error
