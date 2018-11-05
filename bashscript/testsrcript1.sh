#!/bin/bash


SCR='touch reachedfrom101 ; echo "111111" | sudo -S bash -c "apt-get -y install ntp"'

sshpass -p'111111' ssh ubuntu@192.168.56.102 -oStrictHostKeyChecking=no $SCR
