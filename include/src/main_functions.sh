#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/27/2016
# Purpose : source file to include main.sh functions.
# Check to see if user has SUPER USER ACCESS
# beautysh check
source ./include/etc/color_codes.sh

function check_root {

  echo "You Are Currently using Bash $( bash --version )"

  if [ "$EUID" != 0 ];
  then echo -e "$_MSGERROR No Super User Access....Now Exiting..";

    exit 0;
  fi

}

function create_dirs {

  if [ -d "./debug" ];

  then

    echo -e "$_MSGOKAY" "Directories already exist! "

  else
    echo -e "$_MSGLOADING:Creating Directories ..."

    #Main Debug Folder
    mkdir debug
    mkdir ./debug/log
    touch ./debug/log/results.txt
    touch ./debug/log/debug.log
    touch ./debug/log/users.txt
    echo -e "$_MSGOKAY" "Debug Directory Created!"

    # IP Tables
    mkdir ./debug/iptables;
    touch ./debug/iptables/iptables.txt
    touch ./debug/iptables/debug.log
    echo -e "$_MSGOKAY" "IP Tables Directory Created!"
    # SSHD

    mkdir ./debug/sshd
    touch ./debug/sshd/sshd.txt
    touch ./debug/sshd/sshd.log
    echo -e "$_MSGOKAY" "SSHD Directory Created!"

    # Usermanagement
    mkdir ./debug/usermanagement
    touch ./debug/usermanagement/userslist.txt
    echo -e "$_MSGOKAY" "Usermanagement Directory Created!"

    # Distro Dependicies
    mkdir ./debug/distro
    touch ./debug/distro/distroid.cfg
    echo -e "$_MSGOKAY" "Distro Directory Created!"

    echo -e "$_MSGOKAY" "Setting Debug Directory Permisions.."
    chmod -R 777 ./debug
    echo -e "$_MSGSUCCESS All Directories Succsessfully Created."

    echo -e "$_MSGDONE" "Initial Setup Complete!"
  fi

}

function check_distro {

  # This Variable will be output to a file.
  # Then later be used in determining package managers
  # And other distro dependent configs, services or commands.

  _ID=0

  _DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|gentoo|arch)' | uniq )

  if [ -z $_DISTRO ]; then

    _DISTRO='$_MSGERROR Distrobution Detection Failed!'

  fi

  echo "$_MSGSUCCESS Found Distrobution! $_DISTRO "

  if [ "$_DISTRO" = "debian" ]; then

    _ID=1
    _NAME=Debian
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
  fi


  if [ "$_DISTRO" = "ubuntu" ]; then

    _ID=2
    _NAME=Ubuntu
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
  fi


  if [ "$_DISTRO" = "red hat" ]; then

    _ID=3
    _NAME=RedHat
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
  fi


  if [ "$_DISTRO" = "centos" ]; then

    _ID=4
    _NAME=CentOS
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
  fi


  if [ "$_DISTRO" = "gentoo" ]; then

    _ID=5
    _NAME=Gentoo
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
  fi

  if [ "$_DISTRO" = "arch" ]; then

    _ID=6
    _NAME=Arch
    _BANNER=""
    echo "$_ID" > ./debug/distro/distroid.cfg
    echo "$_NAME" >> ./debug/distro/distroid.cfg
    echo -e $_BANNER >> ./debug/distro/distroid.cfg
  fi

}



function clear_debug {


  if [ -d "./debug" ];

  then
    echo "$_MSGFOUND Directories Exist!.. "
    echo "$_MSGLOADING Now deleting...."

    rm -R ./debug

    echo "$_MSGDONE All Cleaned Up!"

  else
    echo "$_MSGWARNING Directories Do Not Exist, Nothing To Delete..."

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

    echo $_MSGSUCCESS "This system has OpenRC, This Host Can Use Service or the Traditional /etc/init.d/SERVICE start|stop|restart"
    #echo $_FINAL

    if [ $_FINAL=1 ] ;

    then

      echo $_MSGOKAY "Using OpenRC!"
      #echo $_FINAL

      echo "Type The Service To Be Managed"
      _SER=
      read _SER

      echo "Would you like to stop start or restart?"

      _SSR=
      read _SSR

      echo $( service $_SER $_SSR );


    else

      echo $_MSGERROR "Logic Error"

    fi # end first inner IF statement

  else
    _SYSTEMD=2
    _FINAL2=$_SYSTEMD
    echo $_MSGSUCCESS "SystemD Found!"

    if [ "$_FINAL2"=2 ] ;

    then
      echo $_MSGOKAY "Using SystemD!"

    else
      echo $_MSGERROR "Logic Error";
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




function tail_auth {
  echo $_MSGLOADING "Tailing..."
  tail -f /var/log/auth.log

}


function find_services {

  echo "Now Finding Services";


} # end find_services








function find_log {

  #search and find log files
  echo " Find logs now";
}

###########################################
## Functions That Call Interface Scripts ##
###########################################

function init_sshd {
  #Simple function that launches sshd script
  bash ./include/sshd.sh
} # end manage_sshd

function init_tables {
  #Simple function that launches Iptables script
  bash ./include/iptables.sh
}

function init_webserver {
  #Simple function that launches Apache script
  bash ./include/webserver.sh
}

function init_findfiles {
  #Simple function that launches search script
  bash ./include/searchfind.sh
}

function init_userman {
  #Simple function that launches usermanagement script
  bash ./include/user_management.sh
}

function init_package {
  #Simple function that launches packagemanager script
  bash ./include/package_manager.sh
}

function init_third {
  #Simple function that launches third party software script
  bash ./include/third.sh
}

function init_backup {
  bash ./include/backup.sh
}
