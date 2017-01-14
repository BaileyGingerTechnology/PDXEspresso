#!/bin/bash 
# Author  : Luis M Pena
# Date    : 12/28/2016
# Purpose : Script that manages users and groups. 

# Include source files
source ./include/source/general_functions.sh
source ./include/source/usermanagement_functions.sh   


function main {

	_UMCHOICE= 
	
    echo "This is the user and groups management interface";
    echo " What Users or groups would you like to manage? ";

    echo "1) Find Users ";
    echo "2) Find Groups ";
    echo "3) Change Passwords";
  	echo "4) Change ALL Passwords";
  	echo "5) Add User";
  	echo "6) Add User To Groups";
  	echo "7) Remove User";
  	echo "8) Remove User From Groups";
  	echo "9) Change User Permissions";



    read _UMCHOICE

case $_UMCHOICE in

    1) find_users; press_enter ;;
    2) find_groups; press_enter ;;
    3) change_pass ; press_enter ;;
   	4) change_pass_all ; press_enter ;;


    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac

}


# Run Main Function
main
