#!/bin/bash

	declare	-a localpath=("aa.sh" "bb.sh" "3")
	declare -a remotepath=("~/script_received.sh" "~/script_received1.sh" "~/genesis.json")

	len=$(( ${#localpath[@]} + 1 ))
	echo len of files + 1 is $len


#	for i in `seq 0 $(( ${#localpath[@]} - 1 ))`; do	
 #  		echo "i" is "$i"
  # 		echo localpath[$i]
   #		echo ${localpath[$i]}
   	#	if [[ ${localpath[$i]} =~ .sh$ ]] ; then 
   	#		echo "yes"
   	#	fi
   	#done


   	for var in 'abc ced fawe awg';do
   		echo $var
   	done


	echo test starts here
	
	echo $@
	echo "$@"
	echo array:
	#echo ($@)
	var=($@)
	var2=(abc def r s t u)
	echo num args
	echo $#
	echo len 
	echo ${#($@)}
	echo len array:
	echo ${#var[@]}
	echo len array2:
	echo ${#var2[@]}
	echo ${var2[@]}
	echo ${# a b d e f}