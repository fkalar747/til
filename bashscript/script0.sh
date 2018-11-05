#!/bin/bash

tmp=`which sshpass`
if [[ ${#tmp} = 0 ]]; then
	echo =======install_sshpass=============
	apt-get install -y sshpass
fi


for var in "$@"
do
    if [[ $var = *"keygen"* ]]; then
		rm -rf ~/.ssh
		mkdir ~/.ssh
		ssh-keygen -N '' -f ~/.ssh/id_rsa
	fi
done

f01=~/.ssh/hostlist 
rm -rf $f01
touch $f01
echo '192.168.56.102' >> $f01

for ip in `cat $f01`; do
	#scp  ~/_setting/script_dist.sh ubuntu@$ip:~

	rfnfin='~/script_received.sh'
	cwd=$(pwd)

	declare	-a localpath=(~/_setting/script_dist.sh ~/_setting/script_dist1.sh ~/genesis.json)
	declare -a remotepath=("~/script_received.sh" "~/script_received1.sh" "~/genesis.json")

	#len=$(( ${#localpath[@]} + 1 ))
	#echo numfiles+1 is $len

	for i in `seq 0 $(( ${#localpath[@]} -1 ))`; do		
		dfn=${localpath[$i]}
		rfn=${remotepath[$i]}
		
		numln=`wc -l < $dfn`
		echo "counted line $numln"

		sshpass -p"111111" ssh ubuntu@$ip -oStrictHostKeyChecking=no "rm -f $rfn && touch $rfn"
		
		numln=$((numln + 1))

		for ln in `seq 1 $numln`;do
			line=`awk "NR==$ln" $dfn`
			echo $line | sed -r "s;';'\\\'';g" 
			sshpass -p"111111" ssh ubuntu@$ip -oStrictHostKeyChecking=no "echo '$line' >> $rfn"
		done
		if [[ ${remotepath[$i]} =~ .sh$ ]] ;then
			sshpass -p"111111" ssh ubuntu@$ip -oStrictHostKeyChecking=no "chmod 777 $rfn"
		fi
	done

	sshpass -p"111111" ssh ubuntu@$ip -oStrictHostKeyChecking=no "nohup $rfnfin > /dev/null 2>&1 &"

	echo 

done
 
 #/etc/ssh/sshd_config