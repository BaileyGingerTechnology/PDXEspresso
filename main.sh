#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/15/2016
# Purpose : Main script for various system administration scripts.
# This script is intended to perform various admin tasks that are focused to save time.
# Script needs super user access. NO EXCEPTIONS.

# Include Source Files

source ./include/src/general_functions.sh
source ./include/src/main_functions.sh


echo "
______________   __  _____
| ___ \  _  \ \ / / |  ___|
| |_/ / | | |\ V /  | |__ ___ _ __  _ __ ___  ___ ___  ___
|  __/| | | |/   \  |  __/ __| '_ \| '__/ _ \/ __/ __|/ _ \
| |   | |/ // /^\ \ | |__\__ \ |_) | | |  __/\__ \__ \ (_) |
\_|   |___/ \/   \/ \____/___/ .__/|_|  \___||___/___/\___/
                             | |
                             |_|

Author: Luis Miguel Pena @poszy
Beta Version: 0.5
Email: pena.m.luis@gmail.com
For Latest Version Visit https://github.com/poszy/PDXEspresso
";

function main {

#Run start functions
check_root
create_dirs


echo -e "\n"

INPUT=

until [ "$INPUT" = "0" ]; do

echo "What would you like to do?";

echo "1)  Searh Ports";
echo "2)  User & Group Management"; #Check Loged in users
echo "3)  Search For Config Files & Services";
echo "4)  Display CPU Info";
echo "5)  SSH Management";
echo "6)  Apache Management";
echo "7)  IP Tables Management";
echo "8)  Package Management";
echo "9)  Install Third Party Software (Splunk,OSSEC)";
echo "10) Tail Auth log";
echo "11) clear all debug logs and clear all temp files";
echo "12) Find/Stop Services ";
echo "13) Hash Entire System with Tripwire";

read INPUT

case $INPUT in

    1) scan_ports ; press_enter ;;
    2) init_userman ; press_enter ;;
    3) init_findfiles ; press_enter ;;
    4) find_cpui ; press_enter ;;
    5) init_sshd ; press_enter ;;
    6) init_apache ; press_enter ;;
    7) init_tables ; press_enter ;;
    8) init_package ; press_enter ;;
    9) init_third ; press_enter ;;
    10) tail_auth ; press_enter ;;
    11) clear_debug ; press_enter ;;
    12) stop_service ; press_enter ;;


    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";


      esac
done

} # end main


# Calling main function.
# This loops the progra and allows a user to get .
# Out of a sub menu and back to the main program.
main
