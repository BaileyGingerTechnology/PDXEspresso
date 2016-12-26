#!/bin/sh
# Author  : Luis M Pena
# Date    : 12/15/2016
# Purpose : Manage script for various system administration scripts.
# This script is intended to perform various admin tasks that are focused to save time.
# Script needs super user access. NO EXCEPTIONS.

echo "

                                                                                                          
______________   __  _____                                   
| ___ \  _  \ \ / / |  ___|                                  
| |_/ / | | |\ V /  | |__ ___ _ __  _ __ ___  ___ ___  ___   
|  __/| | | |/   \  |  __/ __| '_ \| '__/ _ \/ __/ __|/ _ \  
| |   | |/ // /^\ \ | |__\__ \ |_) | | |  __/\__ \__ \ (_) | 
\_|   |___/ \/   \/ \____/___/ .__/|_|  \___||___/___/\___/  
                             | |                             
                             |_|                          


";

# Check to see if user has SUPER USER ACCESS
function check_root {

if [ "$EUID" != 0 ];
    then echo "No Super User Access....Now Exiting..";
    
    exit 0;
fi

}

function create_dirs {

if [[ -d "./iptables" &&  -d "./log"  &&  -d "./sshd" ]];

then
    echo "Directories already exist!
" 
    
else
    echo " Creating Directories ..."
    #Main Debug Folder
    mkdir log
    touch ./log/results.txt
    touch ./log/debug.log 
    touch ./log/users.txt
    # IP Tables 
    mkdir iptables;
    touch ./iptables/iptables.txt
    touch ./iptables/debug.log

    # SSHD

    mkdir sshd
    touch ./sshd/sshd.txt
    touch ./sshd/sshd.log
    
    chmod -R 777 ./log
    chmod -R 777 ./iptables
    chmod -R 777 ./sshd
fi

}

function press_enter {

    echo ""
    echo -n "Press Enter To continue"
    read
    clear

}


function reset {
    main
    
} 

function scan_ports {
   # Run netstat and echo shove that  into results.txt
   _SCAN=$(netstat -tulpn |grep LISTEN)

   #_FILTER=$( awk '/*tcp6/{print}' ./results_filterd.txt )
   _OUTPUT=$_SCAN $_FILTER

   echo $_OUTPUT > ./log/results.txt
   echo $_OUTPUT
   #Filter results.txt into readable format
   #cp -rp results.txt results_filterd.txt

   
   #echo results


} # end scan_ports

function init_tables {
    #Simple function that launches Iptables script
    
    sh ./include/iptables.sh

}

function find_users {

    echo "Finding users in both /etc/passwd & /etc/shadow"
   _PASSWDF=$( awk '/$/{print}' /etc/passwd)
   _SHADOWF=$( awk '/$/{print}' /etc/shadow)

   echo "Printing /etc/passwd";
   echo "$_PASSWDF";
   echo "--------------------------------------------------"
   
   echo "Printing /etc/shadow";
   echo "$_SHADOWF"
   echo "--------------------------------------------------"
   # Need Sorting Expressions to sort everything nicely, and not just one line. 
   echo $_PASSWDF > ./log/users.txt
   echo "Wrote output to ./log/users.txt"

} # end find_users


function find_groups {

    echo "Finding Groups";
    

} #end find_groups


function find_cpui {

    echo "CPU INFO";
    _CPUINFO=$( cat /proc/cpuinfo );
    
    echo $_CPUINFO > results.txt
    echo $_CPUINFO

}

function manage_sshd {

    echo "How would you like to manage the SSH service";
    reset
} # end manage_sshd




function find_services {

    echo "Now Finding Services";

} # end find_services



function main {

#Run create_dirs function
check_root
create_dirs

INPUT=

until [ "$INPUT" = "0" ]; do

echo "What would you like to do?";

echo "1)  Scan Ports";
echo "2)  User & Group Management"; #Check Loged in users
echo "3)  Search For config Files";
echo "4)  Display CPU Info";
echo "5)  SSH Management";
echo "6)  Apache Management";
echo "7)  IP Tables Management";
echo "8)  Find Package Information";
echo "9)  Find Distro Information";
echo "10) Tail Auth log";
echo "11) clear all debug logs and clear all temp files";
echo "12) Find Services ";

read INPUT

case $INPUT in

    1) scan_ports ; press_enter ;;
    2) find_users ; press_enter ;;
    3) free ; press_enter ;;
    4) find_cpui ; press_enter ;;
    5) manage_sshd ; press_enter ;;
    6) free ; press_enter ;;
    7) init_tables ; press_enter ;;
    8) free ; press_enter ;;
    9) free ; press_enter ;;
    10) free ; press_enter ;;
    11) free ; press_enter ;;
    12) free ; press_enter ;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";


      esac
done

} # end main


# Calling main function.
# This loops the progra and allows a user to get .
# Out of a sub menu and back to the main program.
main
