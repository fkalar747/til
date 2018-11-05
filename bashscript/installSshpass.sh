#!/bin/bash

tmp=`which sshpass`
if [[ ${#tmp} = 0 ]]; then
	echo =======install_sshpass=============
	apt-get install -y sshpass
fi
