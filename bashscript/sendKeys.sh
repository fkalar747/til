#!/bin/bash



for ip in `cat ~/_setting/hosts`;do
	echo $ip 
	sshpass -p"111111" ssh-copy-id $ip
done

