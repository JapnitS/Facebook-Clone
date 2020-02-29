
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

* Given a list of files the user will be prompted if they want to change the Read, Write,Execute ( -rwx ) permissions of the file or continue with the same premissions.

* The user has the option to either use a permission code if they want to apply to a particular file modifying the permission requests Or,

* The user could choose the basic English letters instead of the permission codes i.e 'r' for read, 'w' for write and x for execute to change the permissions for each group (owner , groups and others )

* The user also has an option to change the permissions for all files with the same inputted file extension at the same time or individually assign permissions to each file.

* The user may also assign a default value (where the default value can be preset or be inputted by a user) to a file or a group of files without having assigning each of them individual permissions.

### > Execution :

To Execute the custom feature you need to run the script with
the argument '9' on being prompted for an input.

On choosing the appropriate argument user must press ENTER.

- The user will be prompted to input a file extension (eg.  .txt, .pdf, .tmp etc and will be able to see all the files with that extension.
Next, the user needs to decide If they want to continue with the same file or change the permissions.

- Next, The user will be prompted for a permission code if they know the permission code or else they want to edit the file permissions one by one starting from owner.

- The user also has the option to continue with the original permissions or change as per the default code which can be set either by the user or the preset default permissions.

- To change the permissions group wise user needs to enter 'r' , 'w' , 'x' for giving read , write , and execute respectively or input 'n' for disabling the respective permission or choose to continue with the same permission for any group they want.

- The user can now check the changed permissions of the file as per the changes using the 

```bash 
ls -la "file.ext"
```

 command where file is the required file and .ext is the    respective extension

```bash 
Please select 1 for default permission code or select 2 for preset default(666)
777
Do you want to continue for Default conditions for file : ../Project01/hello.txt ?
no
Do you want to edit permissions for the owner ?
yes
Which permissions for owner do you want to modify in order of read write ex ?
(type 'n' to disable the particular condition)
r
w
x
Do you want to edit permissions for the group ?
no 
Do you want to edit permissions for others ?
yes
Which permissions for owner do you want to modify in order of read write ex ?
(type 'n' to disable the particular condition)
n
n
n
New Permissions are -rwxrw---- 1 or 760

```
A sample for the actual code interface 




 



### CUSTOM FEATURE 02 :
The Custom Feature 02 implements the following features:

* Prompts user to enter a file extension or a filename or work with all files present in the repository.

* Outputs the list of files as per the inputs.

* Checks the content of the file for any auxiliary verbs (am, is, our, was etc. )

* Returns the number of occurrences of auxiliary verbs in the script.

* The script is also capable of checking the number of auxiliary verbs and if the count is greater than the number entered by the user then to replace every occurrence of that word with a user inputted word .


### > Execution :

To Execute custom feature 02 the user needs to input '10' on being prompted for an argument

On choosing the appropriate argument user should press ENTER.

-  The user will be prompted to enter a file if they want to check the occurrences of the auxiliary verbs in a specific file or check in the entire repository 
- The user is then asked to input the number of auxiliary verbs in the file 
- The user is also asked for a replacement word which changes all occurrences of the auxiliary verbs present in the file only if the count of auxiliary verbs is more than the tolerated number of auxiliary verbs ( inputted by the user ) 
- The user will then be notified that changes are made in their files
- The user may check the file contents now and check the changes

```bash 
Add an argument for the feature
10
Enter the number of auxillary you want in your file
1
Input a word which will replace all the occurences of the aux words if the number of aux verbs exceed the inputted number!
replace

Do you want to check for a specific file(file) or do you want us to make changes in all 
the appropriate files in the repository based
based on the file extension(all)!?
file
INPUT a file where you want to search for the helping verb?
hello.txt
The number of occurrences of auxiliary verbs in the selected file is 0

```

## Feature 07
 ###  > Description :
This feature is responsible to implement feature 6.7 which implements the following features : 

- Find all shell scripts (i.e ending in .sh) in the repo
- Create a file CS1XA3/Project01/permissions.log if it doesn’t already exist 
- Prompt the user to choose between 'Change' & 'Restore' 

#### CHANGE

- For each shell script, change the permissions so that only people who have write permissions also have executable permissions using the cut commands to access each groups permissions seperately

- Store a log of the file and it’s original permissions in CS1XA3/Project01/permissions.log and overwriting the file if it already exists

#### RESTORE

- When the user chooses the restore option, it restores each file back to its original permission using the permissions saved in the file permissions.log initially and using the stat command.
- The user can check the changes by either checking the programs output or manually check using the 
```bash 
ls -la "file.ext"
```
command where file is the required file and .ext is the    respective extension

### > Execution :
To execute the feature 6.7 the user needs to key in '7' on being prompted for an argument

On choosing the appropriate argument user must press ENTER.

```bash 
Add an argument for the feature
7
Choose Restore Or Change(Restore or Change)
Change
The Current File Permissions for the file ../project_analyze.sh Are : -rwxrwxr-- 1
The New File Permissions for the file ../project_analyze.sh Are : -rwxrwxr-- 1
The Current File Permissions for the file ../bahar.sh Are : -rwxrwxrwx 1
The New File Permissions for the file ../bahar.sh Are : -rwxrwxrwx 1
The Current File Permissions for the file ../Project01/project_analyze.sh Are : -rwxrwxr-- 1
The New File Permissions for the file ../Project01/project_analyze.sh Are : -rwxrwxr-- 1
The Current File Permissions for the file ../Project01/test.sh Are : -r--r--r-- 1
The New File Permissions for the file ../Project01/test.sh Are : -r--r--r-- 1
```

## Feature 08
 ###  > Description :

The Feature 08 implements the feature 6.8 which implements the following features :
- Prompts the user for an input "Backup" or "Restore"

#### BACKUP

- Creating a backup directory if it does not already exist

- Empty the directory if it does exist

- Find all files with the .tmp extension if any exist in the repository

   - Copy all .tmp files to  CS1XA3/Project01/backup directory
    - Delete all the files from their original location
    - Create a file CS1XA3/Project01/backup/restore.log that contains a list of paths of the
files original locations

#### RESTORE

- Uses the paths stored originally in restore.log to restore the files to their original with the initial content

- If no such file ("restore.log") exists then to prompt a user with an error message
- If the backup directory is not found to prompt a respective error message 
- If the file restore.log exists but the no file paths stored in it then prompt the user with an error message

### > Execution :
To execute the feature 6.8 the user needs to key in '8' on being prompted for an argument

On choosing the appropriate argument user must press ENTER.

- Choosing Backup will create a backup in the directory and file restore.log with the copied files inside the backup directory 

```bash 
Add an argument for the feature
8
Choose Backup Or Restore?
Restore
There are no stored file paths 
(No Trace of restore.log was found, please try restoring again )
#no file with .tmp was found in the repository
```

- To check use the command 
```bash
ls 
#in the files original location to check
#if they are restored back
```
The files should be present in the original location with their original contents
 
-------------------------------------------------------------

