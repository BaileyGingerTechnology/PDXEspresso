#!/bin/bash 
# Author  : Luis M Pena
# Date    : 12/28/2016
# Purpose : Script that manages the sshd service.

# Include source files
source ./include/src/general_functions.sh
source ./include/src/sshd_functions.sh


function main {


    _SSHCHOICE= 
    echo "How Would you like to manage opensshd?";

    echo "1) Start | Stop | Restart";
    echo "2) Lock Down VIA predefined ssh config file (located in ./include/raw/sshd_config) ";
    echo "3) Remove openssh client and server";
  	echo "4) Install openssh client and server";


    read _SSHCHOICE

case $_SSHCOICE in

    1) echo manage_ssh; press_enter ;;
    2) echo lock_down; press_enter ;;
    3) add_port ; press_enter ;;
    4) remove_port ; press_enter ;;
    5) nuke_tables ; press_enter ;;
    6) restore_tables ; press_enter ;;
    7) echo "$_IPREMOVE" ; press_enter ;;
    8) echo "$_IPINSTALL" ; press_enter ;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac


}


# Run Main Function
main
