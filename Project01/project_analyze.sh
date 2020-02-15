#!/bin/bash


echo Enter arg number you want to test ?
read test

if [ ! $test -eq 2 ] && [ ! $test -eq 5 ] && [ ! $test -eq 6 ] ; then
echo Not a correct input ! please try again 
read test
fi

IFS=$'\n'
feature_5(){
echo Enter a file extension ?
read filext

file=$(find ../ -type f -name "*.$filext" )

if [ -z "$file" ];then
	echo number of occurences of the file with extension .$filext is 0
else
	count=$(echo "$file" | wc -l)
	echo number of occurences of the file with extension .$filext is $count
fi

}

feature_6(){
echo Input a tag
read x

a=$(find ../ -type f -name "*.py")
if [ ! -f "$x.log" ]; then
	touch "$x.log"
else 
	touch "$x.log" > "$x.log"
fi

	
echo "$( grep -E '^#' $a | grep -w  $x)" >> $x.log

	

}

feature_2(){
if [ -f fixme.log ] ; then
	rm fixme.log
fi
for e in $(find .. -type f) ; do
	if [ $(tail -1 "$e" | egrep "#FIXME") ] ; then
		echo "$e" >> fixme.log
	fi
done 
	

}
feature_$test
