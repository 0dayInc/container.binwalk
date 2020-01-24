#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "${apt} install -y libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pyqtgraph ${assess_update_errors}"
grok_error
