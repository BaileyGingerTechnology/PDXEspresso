#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/28/2016
# Purpose : Script that manages the Third Party Installation service.

# Include source files
source ./include/src/general_functions.sh
source ./include/src/pkg/third_functions.sh

function main {



    echo "Third Party Software Interface.."
  	echo "What would you like to do?"
		echo "NOTE: ONLY 1 INSTANCE OF SPLUNK OR SPLUNK FORWARDER CAN BE INSTALLED AT THE SAME TIME"
		echo "NOTE: Splunk User should already exist"
		echo -e "\n"
		echo "1) Install Splunk"
		echo "2) Install Splunk Forwarder"
  	echo "3) Run Splunk"
		echo "4) Run Forwarder"
  	echo "5) Install OSSEC"
		echo "6) Install SNORT"
		echo "7) Install Tripwire"
		echo "8) Install Nagios"

    _THIRDCHOICE=
    read _THIRDCHOICE

case $_THIRDCHOICE in

    1) splunk_install; press_enter ;;
    2) splunk_forwarder; press_enter ;;
   	3) splunk_run ; press_enter ;;
    4) splunk_run2; press_enter ;;
		5) ossec_install; press_enter ;;
		6) snort_install; press_enter ;;
		7) tripwire_install; press_enter ;;
		8) nagios_install; press_enter ;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac

}



main
