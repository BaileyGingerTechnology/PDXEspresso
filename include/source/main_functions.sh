#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/27/2016
# Purpose : source file to include main.sh functions. 
# Check to see if user has SUPER USER ACCESS
function check_root {

if [ "$EUID" != 0 ];
    then echo "No Super User Access....Now Exiting..";
    
    exit 0;
fi

}

function create_dirs {

if [ -d "./debug" ];

then
    echo " Directories already exist! " 
    
else
    echo " Creating Directories ..."
    #Main Debug Folder
    
    mkdir debug
    mkdir ./debug/log
    touch ./debug/log/results.txt
    touch ./debug/log/debug.log 
    touch ./debug/log/users.txt
    # IP Tables 
    mkdir ./debug/iptables;
    touch ./debug/iptables/iptables.txt
    touch ./debug/iptables/debug.log

    # SSHD

    mkdir ./debug/sshd
    touch ./debug/sshd/sshd.txt
    touch ./debug/sshd/sshd.log
    
    chmod -R 777 ./debug
fi

}


function scan_ports {
   # Run netstat and echo shove that  into results.txt
   _SCAN=$( netstat -tulpn |grep LISTEN )

   #_FILTER=$( awk '/*tcp6/{print}' ./results_filterd.txt )
   _OUTPUT=$_SCAN $_FILTER

   echo $_OUTPUT > ./debug/log/results.txt
   echo $_OUTPUT
   #Filter results.txt into readable format
   #cp -rp results.txt results_filterd.txt

   
   #echo results


} # end scan_ports

function init_tables {
    #Simple function that launches Iptables script
    
    bash ./include/iptables.sh

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
   echo $_PASSWDF > ./debug/log/users.txt
   echo "Wrote output to ./debug/log/users.txt"

} # end find_users


function find_groups {

    echo "Finding Groups";
    

} #end find_groups


function find_cpui {

    echo "CPU INFO";
    _CPUINFO=$( cat /proc/cpuinfo );
    
    echo $_CPUINFO > ./debug/results.txt
    echo $_CPUINFO

}

function manage_sshd {

    echo "How would you like to manage the SSH service";
    reset
} # end manage_sshd




function find_services {

    echo "Now Finding Services";

} # end find_services
  
