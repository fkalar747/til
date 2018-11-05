#!/bin/bash

echo true
echo false

a=10

echo [[ a = 10 ]] #[[ a = 10 ]]
echo [[a=10]] #[[a=10]]

#if [[a=10]];then
#	echo true1
#fi

if [[ $a = 10 ]];then # t
	echo true2
fi
if [[ a = 10 ]];then # f
	echo true3
fi
if (( a = 10 ));then # t
	echo true4
fi
if (( a == 10 ));then # t
	echo true5
fi
if [ which ls ];then # error
	echo true6
fi
if [`which ls`];then # error
	echo true7
fi
if [#`which ls`];then # error
	echo true8
fi
if ['aaa'];then 
	echo true9
fi
var='string1'
if [ ${#var} ];then #t 
	echo true10
fi
var=3
if [ $var ];then #t
	echo true11
fi
var=3
if [ $var ];then #t
	echo true12
fi


## printing b : 20
(( b = 20 ))
echo printing b : $b

## printing b : 30 
(( b 
=
30))
echo printing b : $b

##
echo `seq 1 10`
echo $(seq 1 10)
echo {1..10}
#echo ((seq 1 10))
seqvar={1..20}
echo $seqvar
#seqvar2={abc bcd efg}
#echo $seqvar2
for var in $seqvar; do
	echo $var
done 


 


