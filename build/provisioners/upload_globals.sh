#!/bin/bash --login
cat >/etc/profile.d/globals.sh <<'EOF'
#!/bin/bash --login
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

screen_session=`basename ${0} .sh`
screen_cmd="screen -T xterm -L -S ${screen_session} -d -m /bin/bash --login -c"
assess_update_errors='|| echo IMAGE_ABORT && exit 1'
debconf_set='/usr/bin/debconf-set-selections'
apt="DEBIAN_FRONTEND=noninteractive apt -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confnew'"

grok_error() {
  while true; do
    # Wait until screen exits session
    screen -ls | grep $screen_session
    if [[ $? == 1 ]]; then
      grep IMAGE_ABORT /screenlog.*
      if [[ $? == 0 ]]; then
        echo "Failures encountered in $(ls /screenlog.*) for ${screen_session} session!!!"
        cat /screenlog.*
        rm /screenlog.*
        exit 1
      else
        echo "No errors in $(ls /screenlog.*) detected...moving onto the next."
        ls /screenlog.* > /dev/null 2>&1
        if [[ $? == 0 ]]; then
          rm /screenlog.*
        fi
        break
      fi
    else
      printf '.'
      sleep 9
    fi
  done
}
EOF

chmod 755 /etc/profile.d/globals.sh
