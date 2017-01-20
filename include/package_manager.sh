#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : source file to determine package manager.


source ./include/src/general_functions.sh




function determine_manager {

  _YUM=$( which yum )
  _APT=$( which apt-get)
  _PAC=$( which pacman )
  _EME=$( which emerge )
  _INSTALL="install"
  _PACKAGE=
  _ID=

  if [ ! -z "$_YUM" ];
  	then
  		echo "Using YUM as package manager"

  		export _PACKAGE="$_YUM"
  		export _ID=0

  elif [ ! -z "$_APT" ];
  	then
  		echo "Using YUM as package manager"

  		export _PACKAGE="$_APT"
  		export _ID=1

  elif [ ! -z "$_PAC" ];
  	then
  		echo "Using Pacmaan as package manager"

  		export _PACKAGE="$_PAC"
  		export _ID=2

  elif [ ! -z "$_EME" ];
  	then
  		echo "Using EMERGE as package manager"

  		export _PACKAGE="$_EME"
  		export _ID=3
  		$_PACKAGE "--version"


  else
  		echo "Package Manager Not Found"

  fi



}


function package_install {
	determine_manager

	case $_ID in

    0) install_yum ; press_enter ;;
    1) install_apt ; press_enter ;;
    2) install_pac ; press_enter ;;
    3) install_eme ; press_enter ;;

    0) exit ;;
    *) echo " Package Manager Not Found";


      esac


}

function install_yum {

	source ./include/src/pkg/yum_functions.sh

    _YUMCHOICE=
    echo -e "\n "
    echo "YUM Package Manager Interface";

    echo "1) Update Every Package ";
    echo "2) Install A Package ";
    echo "3) Remove A Package";
    echo "4) Sync Repos";
    echo "5) Install Local RPM";
    echo "6) Remove Local RPM"
    echo "7) Install Developement Tools (GCC, other compilers and build tools)";
    echo "8) Install Only Security Updates";



  read _YUMCHOICE

  case $_YUMCHOICE in

      1) yum_all; press_enter ;;
      2) yum_install; press_enter ;;
      3) yum_remove ; press_enter ;;
      4) yum_sync ; press_enter ;;
      5) yum_local; press_enter;;
      6) yum_rmlocal; press_enter;;
      7) yum_devel; press_enter;;
      8) yum_sec; press_enter;;

      0) exit ;;
      *) echo "Enter a digit above and try not to break this program.";

        esac
}


function install_apt {

	echo "Using APT"
	source ./include/src/pkg/apt_functions.sh
}



function install_pac {

	echo "Using pac"
	source ./include/src/pkg/pac_functions.sh
}


function install_eme {

	source ./include/src/pkg/eme_functions.sh

	EMECHOICE=
	echo "Using EMERGE"
    echo "Gentoo's Package Manager Interface";


    echo "1) Update Every Package ";
    echo "2) Install A Package ";
    echo "3) Remove A Package";
  	echo "4) Sync Repos With Latest Screenshot";
  	echo "5) Install Splunk and Splunk Forwarder"
  	echo "6) Install OSSEC"



    read _EMECHOICE

case $_EMECHOICE in

    1) eme_all; press_enter ;;
    2) eme_install; press_enter ;;
    3) eme_remove ; press_enter ;;
   	4) eme_sync ; press_enter ;;


    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac


}

function main {


	package_install

}

main
