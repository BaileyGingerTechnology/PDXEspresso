#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/27/2016
# Purpose : source file to include iptables functions. made to make files easier to read.

# Set Variables For functions
    _IPDISPLAY=$( iptables -L);
    _IPFLUSH=$( iptables -F);
   
    _IPT="/sbin/iptables"

function add_port {
        
    echo "What kind of protocol would you like to add"
    echo "1) TCP";
    echo "2) UDP";
    
    # SET PROTOCOL CHOICE
    _PROTO=
    read _PROTO

   if [ "$_PROTO" = "1" ];
    
   then
    
    echo "Which TCP port do you want to add?";
     
    # Add Ports Varaibles
    #variable that gets port number
    _PORT=
    read _PORT;
    
    #iptables -A INPUT -p tcp -m tcp --dport "$_PORT" -j ACCEPT
    $_IPT -A INPUT -p tcp --dport "$_PORT" -j ACCEPT
    
    echo "Done ..." 
    echo "Added port $_PORT"

    else
    echo "Which UDP port do you wish to add"
    $_IPT -A INPUT -p udp -m udp --dport "$_PORT" -j ACCEPT 

    fi 
}

function remove_port {

    echo "Removing multiple ports";
    # Remove Ports Varables
    _IPBLKTCP=$( $_IPT -L);
    _IPBLKUDP=$( $_IPT -L);
}

function nuke_tables { 
    
    echo "Nuke IP TABLES AND ALL CHAINS AND ALL POLCIES?"
    echo " Y or N"
    
    _IPNUKE=
    read _IPNUKE

    if [ "$_IPNUKE" = "Y" ];
    then echo " Now nuking firewall"
	$_IPT -F
	$_IPT -X
	$_IPT -t nat -F
	$_IPT -t nat -X
	$_IPT -t mangle -F
	$_IPT -t mangle -X
	$_IPT -t raw -F
	$_IPT -t raw -X
	$_IPT -t security -F
	$_IPT -t security -X
	$_IPT -P INPUT ACCEPT
	$_IPT -P FORWARD ACCEPT
	$_IPT -P OUTPUT ACCEPT
	
	echo "Done..."

    else
	
	echo "You decided to rethink your life.."
	echo "Now exiting..."
	
	exit 0;
    fi
}

function restore_tables {
   
    echo "What would you like to do?"
    echo "1) Save current IP Tables rules, this will apply rules if rebooted"
    echo "2) Restore IP tables from file"
   
     # SET PROTOCOL CHOICE
    _CHOICE=
    read _CHOICE

   if [ "$_CHOICE" = "1" ];
    then iptables-save > source/saved
    
   else
    echo "Full path to restore file, full path and name..";
    
    _IPPATH=
    read _IPPATH
    
    iptables-restore < "$_IPPATH"
    echo "Done.."

   fi
}

function remove_iptables {

    #This function will remove the binary from the operating system
    # Full uninstall including configuration files
    # Use with caution
    
    echo " Removing IP Tables package and configuration files... you have been warned"
  
    

    echo "Done..."
}


function install_iptables {

    #this function will donwload and install iptables depending on your OS and package manager
    echo "Installing IP tables";

    _IPINSTALL=$( $_IPT -L);


    echo "Done ..."
}

function ip_tables {

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

} # end ip_tables
