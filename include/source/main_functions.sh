#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/27/2016
# Purpose : source file to include main.sh functions. 
# Check to see if user has SUPER USER ACCESS
function check_root {

echo "You Are Currently using Bash $( bash --version )"

if [ "$EUID" != 0 ];
    then echo "No Super User Access....Now Exiting..";
    
    exit 0;
fi

}

function create_dirs {

if [ -d "./debug" ];

then
    
    echo -e " \nDirectories already exist! " 
    
else
    echo -e "\nCreating Directories ..."
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

function find_init { 

    # This function will determine what init manager is being used
    # And will return a value that will heavily be relied on in other functions
    # functions that stop, install services and packages . 

    export _SYSTEMD=0
    export _OPENRC=0
    export _UPSTART=0

    #Final Passthrough value will be set to whatever is found

    export _FINAL=

    # Check if host has systemV openrc related scripts
    
    echo "you have this type of init script";
    
    if [ -d /etc/init.d/ ] ;
    then
	export _OPENRC=1

	echo "Can use service"
	export _SERVICE=$( service )
	#export _INIT=$( /etc/init.d/ stop )
	#export _FINAL=$_OPENRC

	#echo $_FINAL
	
	export _FINAL=$_SERVICE
	
   elif [ -d /usr/lib/systemd/system ]; 
    then
	echo "SystemD has been found"
	export _SYSTEMD=1
	export _SYSTEMCTL= $( systemctl );
	export _FINAL=$_SYSTEMCTL;
	
	echo $_FINAL
	echo "SystemD will be used"

  fi

}


function stop_service { 

    
    echo "type in service you would like to stop";
    echo "You have"
    _STOPSERVICE=( $_FINAL --status-all )
    echo "$_STOPSERVICE"
    
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

########### User Management Functions
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

##################

function find_files { 

    echo " Type in a query to have PDXEspresso search "
    echo " 1) Search entire / "
    echo " 2) Search /etc "

}

function find_cpui {

    echo "CPU INFO";
    _CPUINFO=$( cat /proc/cpuinfo );
    
    echo $_CPUINFO > ./debug/results.txt
    echo $_CPUINFO
    echo -e "-------------"
    
    echo "ISSUE INFO";
    _ISSUEINFO=$( cat /etc/issue );
    _RELEASEINFO=$( cat /etc/*-release);
    echo $_ISSUEINFO;
    
    echo -e "------------"
    echo "REALESE INFO";
    echo $_RELEASEINFO;
    
}

function find_package { 
    
    echo " Type in a query to have PDXEspresso find a package "
    echo " 1) Search entire / "
    echo " 2) Search /etc "
}


function find_distro { 
    
    echo " Type in a query to have PDXEspresso find a package "
    echo " 1) Search entire / "
    echo " 2) Search /etc "
}

function tail_auth { 

    tail -f /var/log/auth.log
}

function clear_debug { 


if [ -d "./debug" ];

then
    echo " Directories  exist!.... "
    echo " Now deleting ...."
    
    rm -R ./debug

    echo "Done..."
    
else
    echo " Directories do not exist, nothing to delete ..."
    #Main Debug Folder
    
fi

    
}

function find_services {

    echo "Now Finding Services";

} # end find_services


function dir_bkrestore { 

    echo "This function backs up config files and directories"
    
    echo "What Would you like to do ? "
    echo "1) Backup Config(s) or Dir(s) "
    echo "2) Restore Config(s) or Dir(s)"


    echo "1) Backup /etc" 
    echo "2) Backup /var/www/httpd or /var/www/html "
    echo "3) Backup /var/log  "


}

function find_log { 

    #search and find log files
    echo " Find logs now";
}

######################################
## Functions that call another scripts
######################################

function init_sshd {
    #Simple function that launches sshd script
    bash ./include/sshd.sh
} # end manage_sshd

function init_tables {
    #Simple function that launches Iptables script
    bash ./include/iptables.sh
}

function init_apache {
    #Simple function that launches Iptables script
    bash ./include/apache.sh
} 
