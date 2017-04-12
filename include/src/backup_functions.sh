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
  echo "5) Create A Chron Job That Does options 1-4"

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
  echo "4) Restore Every Backup Inside The Backup Folder"
  echo "5) Create A Chron Job That Does options 1-4"

  read _RESTORE

  case $_RESTORE in


    1) restore_etc; press_enter ;;
    2) restore_apache ; press_enter ;;
    3) restore_log; press_enter;;
    4) restore_root; press_enter;;
    5) restore_chron; press_enter;;

    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

  esac
} # End Backup function


########### START BACKUP FUNCTIONS ################
function backup_etc {


  echo "Creating Back up of /etc"

  echo "If There is already a copy of etc then the new copy will be incremented by 1"
  echo "Example: etc_backup1.tar.gz.date will auto increment to etc_backup2.tar.gz.date"


  if [ ! -f ./backups/etc/etc_backup0.tar.gz* ]; then

      tar -cvf ./backups/etc/etc_backup0.tar.gz."$(date +%F_%R)" /etc
      echo 1 > ./backups/etc/etc_counter.txt
  else
  export i=$(sed -n '1p' < ./backups/etc/etc_counter.txt)
      if [ "$i" -ge 1 ]; then
          tar -cvf ./backups/etc/etc_backup"$i".tar.gz."$(date +%F_%R)" /etc
          ((i++))
          echo "$i" > ./backups/etc/etc_counter.txt
      fi
 fi


}

function backup_apache {
  echo "yes"
}

function backup_log {
  echo "Creating Back up of /var/log"

  echo "If There is already a copy of /var/log then the new copy will be incremented by 1"
  echo "Example: varlog_backup1.tar.gz.date will auto increment to varlog_backup2.tar.gz.date"


  if [ ! -f ./backups/varlog/varlog_backup0.tar.gz* ]; then

      tar -cvf ./backups/varlog/varlog_backup0.tar.gz."$(date +%F_%R)" /var/log
      echo 1 > ./backups/varlog/varlog_counter.txt
  else
  export i=$(sed -n '1p' < ./backups/varlog/varlog_counter.txt)
      if [ "$i" -ge 1 ]; then
          tar -cvf ./backups/varlog/varlog_backup"$i".tar.gz."$(date +%F_%R)" /var/log
          ((i++))
          echo "$i" > ./backups/varlog/varlog_counter.txt
      fi
  fi
}

function backup_root {
  echo "yes"
}

function backup_chron {

  echo " This Will Create a Chron Job / Chron Deamon To Perform Options 1-4"
  echo 'Proceed? Y/N'

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

function restore_chron {

  echo " This Will Create a Chron Job / Chron Deamon To Perform Options 1-4 "
  echo 'Proceed? Y/N'
}

########### END RESTORE FUNCTIONS ################
