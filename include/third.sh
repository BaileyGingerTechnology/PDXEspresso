#!/bin/bash 
# Author  : Luis M Pena
# Date    : 12/28/2016
# Purpose : Script that manages the Third Party Installation service. 

# Include source files
source ./include/src/general_functions.sh
source ./include/src/pkg/third_functions.sh

function main { 

	
	
    echo "Third Party Software Inferface.."
  	echo "What would you like to do?"

  	echo "1) Install Splunk and Splunk Forwarder"
  	echo "2) Run Splunk"
  	echo "3 Install OSSEC"


    _THIRDCHOICE= 
    read _THIRDCHOICE

case $_THIRDCHOICE in

    1) splunk_echo; press_enter ;;
    2) splunk_install; press_enter ;;
    3) splunk_run; press_enter ;;
   	4) eme_sync ; press_enter ;;
  
    
    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac

}



main