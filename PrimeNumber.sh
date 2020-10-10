#!/bin/bash 
echo "welcome to prime number "
#print first 100 prime nos. in reverse order

function initialization(){
echo " enter a range"
read range
checkPrime $((range))
}

function checkPrime(){
count=1
counter=2
range=$1
while [ $count -le $range ]
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
	((counter++))
done
arraySorting ${array[@]}
primeUnitsPlace ${array[@]}
checkPalindrome ${array[@]}
}
function arraySorting(){
for (( k=${#array[@]}; k>=0; k-- ))
do	
	echo "${array[k]}"
	#alternative prime numbers
	((k--))
done
}
function primeUnitsPlace(){
variable=0
for value in ${array[@]}
do
	variable=$(($value%10))
	if [ $variable -eq 1 ]
	then
		echo "prime numbers which has 1 in init units place" $value
	fi
done
}
function checkPalindrome(){
for (( counter=5; counter<=${#array[@]}; counter++ ))
do
	revers=0
	value=${array[counter]}
	while [ $value -gt 0 ]
	do
		reminder=$(($value%10))
		revers=$(( ($revers*10)+$reminder))
		value=$(($value/10))
	done
	if [ $revers -eq ${array[counter]} ]
	then
		echo "prime palindromes are " ${array[counter]}
	fi
done
}
initialization

