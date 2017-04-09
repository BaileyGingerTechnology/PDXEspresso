#!/bin/bash
# Author  : Luis M Pena
# Date    : 04/09/2017
# Purpose : Script that manages the Backup & Restore Service.

# Include source files
source ./include/src/general_functions.sh
source ./include/src/backup_functions.sh

function main {

    echo "[LOADING]: Backup Interace..";
    _BKCHOICE=
    echo "This function backs up config files and directories"

    echo "What Would you like to do ? "
    echo "1) Backup Config(s) or Dir(s) "
    echo "2) Restore Config(s) or Dir(s)"
    read _BKCHOICE

case $_BKCHOICE in


    1) backup_config ; press_enter ;;
    2) restore_config ; press_enter ;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac

}
# Run Main Function
main
