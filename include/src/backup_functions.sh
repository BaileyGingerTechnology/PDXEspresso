#!/bin/bash
# Author  : Luis M Pena
# Date    : 4/09/2017
# Purpose : Script that contains backup and restore functions.


function backup_config {

  echo $_MSGDONE "Backup Interace"
  echo "Please choose an option"
  _BKCHOICE2=
  echo "1) Backup /etc"
  echo "2) Backup /var/www/httpd or /var/www/html "
  echo "3) Backup /var/log  "
  echo "4) Backup Everything"
  read _BKCHOICE2

  case $_BKCHOICE2 in


    1) backup_etc; press_enter ;;
    2) backup_apache ; press_enter ;;
    3) backup_log; press_enter;;
    4) backup_root; press_enter;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

  esac
} # End Backup function


function restore_config {

  echo $_MSGDONE "Restore Interace"
  echo "Please choose an option"
  _RESTORE=
  echo "1) Restore /etc"
  echo "2) Restore /var/www/httpd or /var/www/html "
  echo "3) Restore /var/log  "
  echo "4) Restore Everything"
  read _RESTORE

  case $_RESTORE in


    1) restore_etc; press_enter ;;
    2) restore_apache ; press_enter ;;
    3) restore_log; press_enter;;
    4) restore_root; press_enter;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

  esac
} # End Backup function


########### START BACKUP FUNCTIONS ################
function backup_etc {
  echo "yes"
}

function backup_apache {
  echo "yes"
}

function backup_log {
  echo "yes"
}

function backup_root {
  echo "yes"
}

########### END BACKUP FUNCTIONS ################



########### START RESTORE FUNCTIONS ################
function restore_etc {
  echo "yes"
}

function restore_apache {
  echo "yes"
}

function restore_log {
  echo "yes"
}

function restore_root {
  echo "yes"
}

########### END RESTORE FUNCTIONS ################
