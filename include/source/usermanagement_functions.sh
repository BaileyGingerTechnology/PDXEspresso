#!/bin/bash 
# Author  : Luis M Pena
# Date    : 1/qq/2017
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
   echo $_PASSWDF > ./debug/log/users.txt
   echo "Wrote output to ./debug/log/users.txt"

} # end find_users


function find_groups {

    echo "Finding Groups";
    getent groups *

} #end find_groups

function change_pass { 

    echo "What would you like to do" 
    echo "  PDXEspresso password super duper totally awesome 1000% sage mode changer "
    echo " 1) change user password "
    echo " 2) Have PDX expresso go through the list of users and change all users on system one at a time"

}


