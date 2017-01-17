#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/24/2016
# Purpose : IP Table functions that are managed by manage.sh
# This was put into a seprate script as a sourcee file. 
# Makes it easier for me to manage and read these scripts.

# Include source files
source ./include/src/general_functions.sh
source ./include/src/iptables_functions.sh    

# Setting Global Variables to make things easier and faster
# I Really dont care about conventional coding when it comes to shell scripting

    #Drop all NULL PACKETS
    #iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
    
    # Prevent syn-flood attack
    #iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
    
    # Prevent XMAS packets
    #iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

    #Find wired nic, assuming lo or eth0, we need to allow traffic to one of these interfaces.
    #iptables -A INPUT -i lo -j ACCEPT
    
    #iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    #iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

function main {

    _IPCHOICE= 
    echo "How Would you like to manage IP tables?";

    echo "1) Display IP Tables";
    echo "2) Flush IP Tables";
    echo "3) Add new Port to LISTEN";
    echo "4) Block new port";
    echo "5) NUKE POLICY & CHAIN & RULES";
    echo "6) Restore firewall from file";
    echo "7) Remove IPtables & configuration files";
    echo "8) Install iptables";

    read _IPCHOICE

case $_IPCHOICE in

    1) echo "$_IPDISPLAY"; press_enter ;;
    2) echo "$_IPFLUSH" ; press_enter ;;
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

# Run main function
main


