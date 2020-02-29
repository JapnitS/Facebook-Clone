#!/bin/bash
IFS=$'\n'
echo Add an argument for the feature 
read test
cd ..
abs=$(pwd)
cd Project01
if [ $test != 2 ] && [ $test != 5 ] && [ $test != 6 ] && [ $test != 7 ] && [ $test != 8 ] && [ $test != 9 ] && [ $test != 10 ] ; then
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
feature_7(){
echo Choose Restore Or Change"(Restore or Change)"
read ans
if [[ "$ans" = "Change" ]] ; then
        if [ -f "permissions.log" ] ; then
                rm "permissions.log"
                touch "permissions.log"
        fi
        for e in $(find ..  -type f -name "*.sh")
        do
                echo The Current File Permissions for the file $e Are : "$((ls -l $e) | cut -c1-12 )" 
                x="$((ls -l $e) | cut -c1-12 )"
                y="$(stat -c '%a' $e)"
                echo $x $y $e >> permissions.log
                a="$((ls -l $e) | cut -c1-4 )"
                ch="$((ls -l $e) | cut -c3 )"
                b="$((ls -l $e) | cut -c5-7 )"
                cha="$((ls -l $e) | cut -c6 )"
                c="$((ls -l $e) | cut -c8-10 )"
                chu="$((ls -l $e) | cut -c9 )"
                if [ $ch = "w" ]  ; then
                        chmod u+x $e
                elif [ ! $ch = "w" ] ; then
                        chmod u-x $e

                fi
                if [ $cha = "w" ] ; then
                        chmod g+x $e
                elif [ ! $cha = "w" ] ; then
                        chmod g-x $e
                fi
                if [ $chu = "w" ] ; then
                        chmod o+x $e
                elif [ ! $chu = "w" ] ; then
                        chmod o-x $e
                fi
                echo The New File Permissions for the file $e Are : "$((ls -l $e) | cut -c1-12 )"
        done

elif [[ "$ans" = "Restore" ]] ; then

        if [ -f permissions.log ] ; then
        while read line ; do
                op=$(echo $line | cut -c 14-16)
                po=$(echo $line | cut -b 18- )
                chmod $op $po
        done < permissions.log
        else
                echo Permissions.log does not exist
        fi
else
        echo Please input a correct output
        read ans
fi
}

feature_8(){
echo Choose Backup Or Restore?
read ans
if [[ "$ans" == "Backup" ]] ; then
        if [ -d backup ] ; then
                rm -r backup
                mkdir backup
        else
                mkdir backup
        fi
        cd backup
        if [ -f restore.log ] ; then
                rm restore.log
                touch restore.log
        fi
        cd ..
        for e in $(find $abs/  -type f -name "*.tmp")
        do
                cp $e backup
                cd backup
                echo $e >> restore.log
                cd ..
                rm $e
        done
elif [[ "$ans" == "Restore" ]] ; then
        if [ ! -d backup ] ; then
                echo Backup Not Found
        elif [ -d backup ] ; then
                cd backup
                if [ ! -f restore.log ] ; then
			echo There are no stored file paths "(No Trace of restore.log was found, please try restoring again )" 
                else
                        while read lop ; do

                                path=$(echo $lop)
                                name=$(basename $path)
                                echo The file which is being restored is : $name
                                till=$(dirname $path)
                                echo The directory where the file was originally in :  $till
				if [ ! -f "$name" ] ; then
					echo "The file you are looking for is missing "
				else
                                	mv $name $till
				fi
                        done < restore.log
                fi
        fi
fi
}


feature_9(){

echo Input a file extension
read ext
file=$(find ../ -type f -name "*.$ext" )
if [ -z "$file" ];then
        echo number of occurences of the file with extension .$filext is 0
else
        count=$(echo "$file" | wc -l)
        echo The number of files inputted extension  ."$ext"  in current directory are : "$count"

fi
echo Do You want to continue with the same file extension ?
read ans
if [ ! $ans == "yes" ] ; then
        echo Enter file extension again ...
        ./self.sh
else
                file=$(find ../ -type f -name "*.$ext" )
                echo list of found files $file
fi
echo Do you want to change the file permissions?
if [ ! $ans == "yes" ] ; then
        echo no problem
        ./self.sh
else
        for e in $file
        do
                echo $e
                echo current file permissions are "$((ls -l $e) | cut -c1-12 )"
                echo do you want to change file perm?
                read ans
                if [ ! $ans == "yes" ] ; then
                        echo I guess you want to continue with the same file permissions
                else
                        echo Are you sure about the rwx permission code?
                        read ans
                        if [ ! $ans == "no" ] ; then
                                echo input file perms
                                read perms
                                chmod $perms $e
                                echo file permissions chaged to $e which is "$((ls -l $e) | cut -c1-12 )"
                        fi
                               echo Please select 1 for default permission code or select 2 for preset default"(666)" 
                                read pot
                                if [ $pot -eq 1 ] ; then
                                        echo Enter Default Permission Code
                                        read default
                                elif [ $pot -eq 2 ] ; then
                                        echo Keeping default permissions to be 666
                                        default=666
                                fi

                        echo Do you want to continue for Default conditions for file : "$e" ?
                        read lop
                        if [[ $lop == "yes" ]] ; then
                                chmod $lop $e
                                echo File permissions for file $e changed to default permissions  : $default
                        fi
                                echo Do you want to edit permissions for the owner ?
                                read edit
                                if [[ $edit == "yes" ]] ; then

                                        echo Which permissions for owner  do you  want to modify in order of read write ex ?"(type 'n' to disable the particular condition)"
                                        read a
                                        if [ $a == "r" ] ; then
                                                a=1
                                        elif [ $a == "n" ] ; then
                                                a=0
                                        fi
                                        read b
                                        if [ $b == "w" ] ; then
                                                b=1
                                        elif [ $b == "n" ] ; then
                                                b=0
                                        fi
                                        read c
                                        if [ $c == "x" ] ; then
                                                c=1
                                        elif [ $c == "n" ] ; then
                                                c=0
                                        fi
                                        d=$(($a+2*$b+4*$c))
                                else
                                        d="$(stat -c '%a' $e | cut -c1-1 )"
                                fi

                                echo Do you want to edit permissions for the group ?
                                read edit
                                if [[ $edit == "yes" ]] ; then

                                        echo Which permissions for owner  do you  want to modify in order of read write ex ?"(type 'n' to disable the particular condition)"
                                        read a
                                        if [ $a == "r" ] ; then
                                                a=1
                                        elif [ $a == "n" ] ; then
                                                a=0
                                        fi
                                        read b
                                        if [ $b == "w" ] ; then
                                                b=1
                                        elif [ $b == "n" ] ; then
                                                b=0
                                        fi
                                        read c
                                        if [ $c == "x" ] ; then
                                                c=1
                                        elif [ $c == "n" ] ; then
                                                c=0
                                        fi
                                        g=$(($a+2*$b+4*$c))
                                else
                                        g="$(stat -c '%a' $e | cut -c2-2 )"
                                fi
                                 echo Do you want to edit permissions for others ?
                                read edit
                                if [[ $edit == "yes" ]] ; then

                                        echo Which permissions for owner  do you  want to modify in order of read write ex ?"(type 'n' to disable the particular condition)"
                                        read a
                                        if [ $a == "r" ] ; then
                                                a=1
                                        elif [ $a == "n" ] ; then
                                                a=0
                                        fi
                                        read b
                                        if [ $b == "w" ] ; then
                                                b=1
                                        elif [ $b == "n" ] ; then
                                                b=0
                                        fi
                                        read c
                                        if [ $c == "x" ] ; then
                                                c=1
                                        elif [ $c == "n" ] ; then
                                                c=0
                                        fi
                                        f=$(($a+2*$b+4*$c))
                                else
                                        f="$(stat -c '%a' $e | cut -c3-3 )"
                                fi
                                        chmod $d$g$f $e
                                        echo New Permissions are  "$((ls -l $e) | cut -c1-12 )" or "$(stat -c '%a' $e )"
                        fi
                done
fi
}

feature_10(){
        IFS=$'\t'
        aux=("am\tis\tar\twas\tand\twere\tbeing\tbeen\tand\tbe\thave\thas\thad\tdo\tdoes\tdid\twill\twould\tshall\tshould\tmay\tmight\tmust\tcan\tcould")
        unset IFS
        echo Enter the  number of auxillary you want in your file
        read num
        echo Input a word which will replace all the occurences of the aux words if the number of aux verbs exceed the inputted number!
        read top
        echo Do you want to check for a specific file"(file)" or do you want us to make changes in all the appropriate files in the repository based on the file extension"(all)"!?
        read option
        if [[ $option == "file" ]] ; then
                echo INPUT a file where you want to search for the helping verb?
                read a
                cnt=0
                while IFS= read -r line
                do
                        for word in $line
                        do
                                for x in $word
                                do
                                        if [[ "\t${aux[@]}\t" =~ "\t${x}\t" ]]; then

                                                cnt=$((cnt+1))
                                        fi
                                done
                        done
                done < "$a"
                echo The number of occurences of auxillary verbs in the slected file is$cnt
                if [ $cnt > $num ] ; then
                        while IFS= read -r line
                        do
                                for word in $line
                                do
                                        for x in $word
                                        do
                                                if [[ "\t${aux[@]}\t" =~ "\t${x}\t" ]]; then
                                                        echo $x
                                                        sed -i "s/${x}/${top}/g" $a
                                                        echo $top
                                                fi
                                        done
                                done
                        done < "$a"
                        cat $a
                fi
        elif [[ $option == "all" ]] ; then
                echo Checking in all files one by one
                echo Enter extension you want to check for?
                read ext
                for e in $(find .. -type f -name "*.$ext" ) ; do
                        echo The file being checked is : $e                     
                        cnt=0
                        while IFS= read -r line
                        do
                                for word in $line
                                do
                                        for x in $word
                                        do
                                                if [[ "\t${aux[@]}\t" =~ "\t${x}\t" ]]; then

                                                        cnt=$((cnt+1))
                                                fi

                                        done
                                done
                        done < "$e"
                        echo The number of occurences of auxillary verbs in the slected file $e  is $cnt
                        if [ $cnt > $num ] ; then
                                while IFS= read -r line
                                do
                                        for word in $line
                                        do
                                                for x in $word
                                                do
                                                        if [[ "\t${aux[@]}\t" =~ "\t${x}\t" ]] ; then
                                                                sed -i "s/${x}/${top}/g" $e
                                                        fi
                                                done
                                        done
                                done < "$e"
                        fi
                done
        fi
}
feature_$test

