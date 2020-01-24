#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "${apt} install -y libqt4-opengl python-opengl python-qt4 python-qt4-gl python-numpy ${assess_update_errors}"
grok_error

$screen_cmd "pip install pyqtgraph ${assess_update_errors}"
grok_error
