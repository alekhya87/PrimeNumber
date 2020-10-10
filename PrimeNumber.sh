#!/bin/bash 
echo "welcome to prime number "
#print first 100 prime nos. in reverse order

function initialization(){
echo " enter a range"
read range
checkPrime $((range))
}

function checkPrime(){
count=0
range=$1
for (( counter=700; $counter<=$(($1+1)); counter++ ))
do
	flag=0
	for (( j=2; j<=$(($counter/2)); j++ ))
	do
		if [ $(($counter%$j)) -eq 0 ]
		then
			flag=1
			break
		fi
	done
	if [ $flag -eq 0 ]
	then
		#echo $counter
		array[count]=$counter
		((count++))
	fi
done
arrayReversOrder ${array[@]}
}
function arrayReversOrder(){
for (( k=${#array[@]}; k>=0; k-- ))
do	
	echo "${array[k]}"
	#alternative prime numbers
done
}
initialization

