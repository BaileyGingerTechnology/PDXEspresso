#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/24/2016
# Purpose : IP Table functions that are managed by manage.sh
# This was put into a seprate script as a sourcee file. 
# Makes it easier for me to manage and read these scripts.

# Include source files
source ./include/source/general_functions.sh
source ./include/source/iptables_functions.sh    

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

    echo "Main Function";
    ip_tables

}

# Run main function
main


