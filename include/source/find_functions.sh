#!/bin/bash 
# Author  : Luis M Pena
# Date    : 1/03/2017
# Purpose : Script that contains find functions.


function find_byroot { 

	echo "Searching root directory"


}

function find_byetc { 

	echo "Searching etc directory"


}

function find_bystring { 

	echo "Searching By String "


}

function find_byusername { 

	echo "Searching files by username"


}

function find_bylog { 

	echo " Searching for Logs "
}

function find_files { 

    _FFCHOICE= 
    echo "How would you like to search";

    echo "1) Search entire / ";
    echo "2) Search /etc ";
    echo "3) Search for a STRING or SUBSTRING inside a file or directory ";
    echo "4) Find file by username ";
    echo "5) Find Logs"

    read _FFCHOICE

case $_FFCHOICE in

    1) find_byroot; press_enter ;;
    2) find_byetc ; press_enter ;;
    3) find_bystring ; press_enter ;;
    4) find_byusername ; press_enter ;;
    5) find_bylog ; press_enter ;;
    

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac
      

}


