#!/bin/bash

echo Add an argument for the feature 
read test

if [ $test != 2 ] && [ $test != 5 ] && [ $test != 6 ] ; then
	echo The argument is not correct! Please try again
	read test
fi
feature_2(){
if [ -f fixme.log ] ; then
	rm fixme.log
fi
for e in $(find .. -type f) ; do
	if [ $(tail -1 "$e" | egrep "*FIXME") ] ; then
		echo "$e" >> fixme.log
	fi
done

}
feature_5(){
echo Input any file extension
read filext
a=$(find ../ -type f -name "*.filext")
count=$(echo "$a" | wc -l)
if [ -z "$a" ] ; then
	echo "Number of files with this extension are 0"
else
	echo "Number of files with "*.filext" are $count"

fi
}
feature_6(){
echo "Input any tag:"
read x
if [ ! -f "$x.log" ] ; then
	touch "$x.log"
else
	touch "$x.log" > "$x.log"
	f=$(find ../ -type f -name "*.py")
	echo $(grep -E '^#' $f | grep -w $x) >> $x.log
fi

}
feature_$test
