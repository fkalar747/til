#!/bin/bash


SCR='touch reachedfrom101 ; echo -e "111111\n bash -c \"touch reachedfrom1012 \" " | sudo -S bash -c "apt-get -y install ntp"'

sshpass -p'111111' ssh ubuntu@192.168.56.102 -oStrictHostKeyChecking=no $SCR
