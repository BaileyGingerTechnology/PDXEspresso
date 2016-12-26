#!/   bin/sh
# Author  : Luis M Pena
# Date    : 12/24/2016
# Purpose : IP Table functions that are managed by manage.sh
# This was put into a seprate script as a sourcee file. 
# Makes it easier for me to manage and read these scripts.


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

    # Set Variables For functions
    _IPDISPLAY=$( iptables -L);
    _IPFLUSH=$( iptables -F);
   

function press_enter {

    echo ""
    echo -n "Press Enter To continue"
    read
    clear

}


function reset {
    main
    
} 


function add_port {

    echo "What kind of protocal would you like to add"
    echo "1) TCP";
    echo "2) UDP";
    
    #set input variable
    _PORT=
    read $_PORT; 

     # Add Ports Varaibles
    _IPADDTCP=$(iptables -A INPUT -p tcp -m tcp --dport $_PORT -j ACCEPT );
    _IPADDUDP=$( iptables -L);

}

function remove_port {

    echo "Removing multiple ports";
    # Remove Ports Varables
    _IPBLKTCP=$( iptables -L);
    _IPBLKUDP=$( iptables -L);
}


function nuke_tables { 
    _IPNUKE=$( iptables -L);
    
    echo "Nuke IP TABLES AND ALL CHAINS AND ALL POLCIES?"
    echo " Y or N"
    
    echo "Done..."

}

function restore_tables {
    _IPRESTORE=$( iptables -L);
    echo "Full path to restore file.. type in now..";
    
    echo "Done.."

}

function remove_iptables {

    #This function will remove the binary from the operating system
    # Full uninstall including configuration files
    # Use with caution
    _IPREMOVE= $( iptables -L);
    echo " Removing IP Tables package and configuration files... you have been warned"
    echo "Done..."

}


function install_iptables {

    #this function will donwload and install iptables depending on your OS and package manager
    echo "Installing IP tables";

    _IPINSTALL=$( iptables -L);


    echo "Done ..."
}

function ip_tables {

    _IPCHOICE = 
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
    6) remove_tables ; press_enter ;;
    7) echo "$_IPREMOVE" ; press_enter ;;
    8) echo "$_IPINSTALL" ; press_enter ;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac

} # end ip_tables

function main {

    echo "Main Function";
    ip_tables

}

# Run main function
main


