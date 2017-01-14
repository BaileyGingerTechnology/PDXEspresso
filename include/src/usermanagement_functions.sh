#!/bin/bash 
# Author  : Luis M Pena
# Date    : 1/11/2017
# Purpose : Script that contains User Management functions. 


function find_users {

    echo "Finding users in both /etc/passwd & /etc/shadow"
   _PASSWDF=$( cut -d: -f1 /etc/passwd)
   _SHADOWF=$( cut -d: -f1 /etc/shadow)

   echo "Printing /etc/passwd";
   echo "$_PASSWDF";
   echo "--------------------------------------------------"
   
   echo "Printing /etc/shadow";
   echo "$_SHADOWF"
   echo "--------------------------------------------------"
   # Need Sorting Expressions to sort everything nicely, and not just one line. 
   echo $_PASSWDF > ./all user passworddebug/log/users.txt
   echo "Wrote output to ./debug/log/users.txt"

} # end find_users


function find_groups {

    echo "Finding Groups";
    getent group 

} #end find_groups

function change_pass { 

    echo "PDXEspresso password super duper totally awesome 1000% sage mode changer "
    echo -e "\n"
    echo "Enter the user password you would like to change"

   _CP=
   read _CP

   echo "Now Changing Password ..."
   passwd "$_CP"

}


function change_pass_all { 

	#cut -d: -f1,3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1

	echo "THIS WILL CHANGE THE PASSWORD FOR EVERY USER ON THE SYSTEM TO THE SAME PASSWORD"
	echo -e "\nYOU HAVE BEEN WARNED"
	echo "WOULD YOU LIKE TO PROCEED?? ENTER y or Y PROCEED"

	declare -l _CPA=
	read _CPA

	if [ "$_CPA" = "y" ];
		then 

		# This will print all human users into a file
		_HUSERS=$( cut -d: -f1,3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1 )
		echo $_HUSERS > ./debug/usermanagement/userslist.txt
		echo "root" >> ./debug/usermanagement/userslist.txt
			
		echo "Enter Desired Password Now"
		_NEWPASSWORD=
		read _NEWPASSWORD

		for i in `cat ./debug/usermanagement/userslist.txt`;
			do
				echo -e "$_NEWPASSWORD\n""$_NEWPASSWORD" | passwd "$i"
			done
	else 
		echo "You chose to exit"
	fi

	exit 0;
}