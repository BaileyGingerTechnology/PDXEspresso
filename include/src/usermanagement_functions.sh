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


function user_add { 

	# universal way of adding a new user
	# some distros dont have the good adduser, that gives them a home directory and puts them in groups

	_GROUP=
	_USERSTRING=
	declare -l _HCHOICE=
	echo "adding a new user"
	echo "Enter desired username now"
	read _USERSTRING

	echo "What group will" "$_USERSTRING" "Be In?"
	read _GROUP
	echo "$_USERSTRING" "Will be in group" "$_GROUP"

	echo "Does this user need a home directory? Y or N "
	read _HCHOICE

	if [ "$_HCHOICE" = "y" ];
		then
		echo "Now Creating" "$_USERSTRING" " With a Home Directory "
		useradd -m -G "$_GROUP" -s /bin/bash "$_USERSTRING"

	elif [ "$_HCHOICE" = "n" ];
		then
		echo "Now Creating" "$_USERSTRING" " Without a Home Directory "
		useradd -G "$_GROUP" -s /bin/bash "$_USERSTRING"

	fi
	
	passwd $_USERSTRING

}

function add_togroup { 

	_GROUPTWO=
	_USERSTRINGTWO=
	
	
	echo "Enter desired username that will be added to a new group"
	read _USERSTRINGTWO

	echo "What group will" "$_USERSTRINGTWO" "Be In?"
	read _GROUPTWO

	echo "$_USERSTRINGTWO" "Will be added to" "$_GROUPTWO"
	usermod -a -G "$_GROUPTWO""$_USERSTRINGTWO"

}


function del_user { 

	_GROUP3=
	_USERSTRING3=
	
	
	echo "Which User shall be deleted?"
	read _USERSTRING3

	
	echo "$_USERSTRING3" "Will be deleted"

	userdel -rf $_USERSTRING3

}


function rm_fromgroup { 

	_GROUP4=
	_USERSTRING4=
	
	
	echo "Enter desired username that will be removed from a group"
	read _USERSTRING4

	echo "What group will" "$_USERSTRING4" "Be remvoed from?"
	read _GROUPTWO4
	echo "$_USERSTRING4" "Will be removed from" "$_GROUP4"

	gpasswd -d "$_USERSTRING4" "$_GROUP4"

}

function mod_perm { 
	_USERSTRING5=
	#Copying the sudoers file just in case something goes wrong...
	cp /etc/sudoers ./debug/usermanagement/sudoers.bk

	echo "Which user will be given super user rights?"
	read _USERSTRING5

	echo "$_USERSTRING5"" ALL=(ALL) ALL" >> /etc/sudoers

}