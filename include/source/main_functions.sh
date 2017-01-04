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

function stop_service { 

   #Declare Variables
    _OPENRC=0
    _SYSTEMD=0
    _UPSTART=0
    _FINAL=0
    _INIT=0

   
    if [ -d /etc/init.d/ ] ; # Start Main If Statement
    then
	 _OPENRC=1
	 _FINAL=$_OPENRC


	echo "This system has OpenRC, This host can use service or the traditional /etc/init.d/SERVICE start|stop|restart"
	
	echo $_FINAL
	
	if [ $_FINAL=1 ] ;
	    then 
	     echo "Using OPENRC for sure"
	     echo $_FINAL
	     
	     
	     echo "Type in the service you would like to stop"
	     _SER=
	     read _SER
	     
	     echo "Would you like to stop start or restart?"
	     
	     _SSR=
	     read _SSR

	     echo $( service $_SER $_SSR );


	    else echo "logic error"
	fi # end first inner IF statement
       
   else 
	_SYSTEMD=2
	 _FINAL2=$_SYSTEMD
	echo "SystemD has been found"
	##
	if [ $_FINAL2=2 ] ;
	    then echo "Using SYSTEMD for sure"
	    else echo "logic error";
	fi # end second inner IF statementif 
	##

  fi # end Main If statement 

  

}

### This function will not be used
## but will be kept in here to remind me of the way i wantred to code
## the service manager
## bash  as forced me to use unconventional way of coding
## I do not like it. But this is how it will be. 
 
function stop_servicessss { 

    # This function will determine what init manager is being used
    # And will return a value that will heavily be relied on in other functions
    # functions that stop, install services and packages . 

    export _SYSTEMD=0
    export _OPENRC=0
    export _UPSTART=0

    
    # Check if host has systemV openrc related scripts
    
    if [ -d /etc/init.d/ ] ;
    then
	 _OPENRC=1

	echo "This system has OpenRC, This host can use service or the traditional /etc/init.d/SERVICE start|stop|restart"
	
	 _SERVICE=$( service )
	#export _INIT=$( /etc/init.d/ stop )
     
	#echo $_FINAL
	
	 _FINAL= $_SERVICE
	#echo $_FINAL

   elif [ -d /usr/lib/systemd/system ]; 
    then
	echo "SystemD has been found"
	export _SYSTEMD=1
	export _SYSTEMCTL= $( systemctl );
	export _FINAL=$_SYSTEMCTL;
	
	echo $_FINAL
	echo "SystemD will be used"

  fi

    if [ $_OPENRC=187987897979792 ];
       then
	echo "type in service you would like to start|stop|restart";
	echo "Currently Using $_FINAL init Manager" 
	else echo "There is a mean ass error LUIS GET YOUR SHIT TOGETHER"
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
    echo " 3) Search for a STRING or SUBSTRING inside a file or directory "

    # Function Variables
    _CHOICE=
 
    read _CHOICE
    
   if [ "$_CHOICE" = "1" ];
    
    then
    
      echo "Type in the name of config file OR Query to search entire root partition  "
      _QUERY=
      read _QUERY
      
      find / -type f -name "$_QUERY"
      echo "Done ..." 
  
    elif [ "$_CHOICE" = "2" ]; 
     
      then 
      echo "Type in the name of config file OR Query to search /etc"
      _QUERY2=
      read _QUERY2
      
      find /etc -type f -name "$_QUERY2" 

    elif [ "$_CHOICE" = "3" ]; 
      then 
      
      echo "Type in the STRING OR SUBSTRING"
      _QUERY=
      read _QUERY

      echo "Type in location of file or directory"
      _DIR=
      read _DIR 
     
      find / -type f -name "$_QUERY" "$_DIR"
        
    fi 
      

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

function init_findfiles { 
  #Simple function that launches Iptables script
   bash ./include/searchfind.sh
}