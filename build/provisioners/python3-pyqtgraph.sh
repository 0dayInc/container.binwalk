#!/bin/bash --login
source /etc/profile.d/globals.sh

$screen_cmd "${apt} install -y libqt5opengl5 python3-opengl python3-pyqt5 python3-pyqt5.qtopengl python3-numpy python3-scipy python3-pyqtgraph ${assess_update_errors}"
grok_error
