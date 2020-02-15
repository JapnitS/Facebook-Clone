
# CS1XA3 Project 01 - singj36 


The Project 1 has four implemented features


## Usage
 Execute the script from project root with :
```bash
chmod +x CS1XA3/Project01/project_analyze.sh

./CS1XA3/Project01/project_analyze.sh 
```
You will be required to input script arguments to execute distinct implemented features 

If the user inputs a script argument other than the listed arguments it will return an error message and prompts the user to input the argument again.

### Possible Arguments List 
    5 : To implement feature 5 ( File Type Count )
    6 : To implement feature 6 ( Find Tag )
    2 : To implement feature 2 ( FIXME Log )

## Feature 05
 ###  > Description :
   This feature is responsible to implement feature 6.5 which is to count the total number of files given of a particular file extension given an appropriate input (.py, .txt, .pdf, etc) 

```bash 
file=$(find ../ -type f -name "*.$filext" )
```

 
The feature will return 0 in case no file with the given extension is found in the repository.

```bash 
Enter a file extension ?
lol
number of occurences of the file with extension .lol is 0
```

### > Execution :

To execute the feature you shall execute the script and choose argument '5' on being prompted for a script argument.

```bash 
Enter arg number you want to test ?
5
Enter a file extension ?
txt
number of occurences of the file with extension .txt is 7
```




On choosing the appropriate argument user shall input the file extension (**NOTE** : input the file extension without the ' . ' ) and press ENTER

The user shall now be able to view the output related to that file extension.


## Feature 06
 ###  > Description :
   This feature is responsible to implement feature 6.6 which is to write all those lines in the files with the extension ' .py ' present in our repository which have a ' # ' and ' tag ' inputted by the user into a file named " tag ".log where tag is the keyword inputted by the user using the feature.

```bash 
a=$(find ../ -type f -name "*.py")
#Responsible to find all .py files in the directory
```

```bash 
echo "$( grep -E '^#' $a | grep -w  $x)" >> $x.log
#Responsible to find and match all patterns with '#' and 'tag'
#using grep and write it to file "x.log" where x is the tag
```


The feature will return an empty file if no line with an occurrence of ' # ' and ' tag ' were found.


### > Execution :

To execute the feature you shall execute the script and choose argument '6' on being prompted for a script argument

On choosing the appropriate argument user shall input the tag they want to search for and press ENTER

```bash 
Enter arg number you want to test ?
6
Input a tag
HELLO
➜  Project01 git:(project01) ✗ cat HELLO.log
../somedir/a2.py:#JAPNIT HELLO
../Project01/a b.py:#HELLO
```


The user shall now be able to view the output in the file named "tag".log where tag is the tag entered by the user.


## Feature 02
 ###  > Description :
   This feature is responsible to implement feature 6.2 which is to write all those filenames present in our repository with a "#FIXME" in their last line to a file fixme.log.

```bash 
[ $(tail -1 "$e" | egrep "#FIXME") ]
#Responsible to find all files in the directory which have a 
#FIXME in their last line
```




### > Execution :
=======
>>>>>>> project01

To execute the feature you shall execute the script and choose argument '2' on being prompted for a script argument

On choosing the appropriate argument user must press ENTER.

The user shall now be able to view the appropriate file names in the file fix.log

```bash 
➜  Project01 git:(project01) ✗ cat fixme.log
../fix.log
../Project01/f.log
../Project01/japnit singh
```




## CUSTOM FEATURES 

### CUSTOM FEATURE 01 :
The Custom Feature 01 implements the following features:
* Shows the user a list of of all files present in the repository they can choose from based on the file extension they want to look for.

* Given a list of files the user will be prompted if they want to change the Read, Write,Execute ( -rwx ) permissions of the file

* The user has the option to either use a permission code if they want to apply to a particular file modifying the permission requests Or,

* The user could choose the basic English letters instead of the permission codes i.e 'r' for read, 'w' for write and x for execute to change the permissions for each group (owner , groups and others )

* The user also has an option to change the permissions for all files with the same inputted file extension at the same time or individually assign permissions to each file.

* The user may also assign a default value (where the default value can be preset or be inputted by a user) to a file or a group of files without having assigning each of them individual permissions.


### CUSTOM FEATURE 02 :
The Custom Feature 01 implements the following features:

* Prompts user to enter a file extension or a filename.

* Outputs the list of files as per the inputs.

* Checks the content of the file for any auxiliary verbs (am, is, our, was etc. ) 

* Returns the number of occurrences of auxiliary verbs in the script.

* The script is also capable of checking the number of auxiliary verbs and if the count is greater than the number entered by the user then to replace every occurrence of that word with a user inputted word .


