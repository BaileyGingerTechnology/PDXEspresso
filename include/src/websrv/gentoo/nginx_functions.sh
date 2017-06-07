#!/bin/bash
# Author  : Luis M Pena
# Date    : 3/28/2017
# Purpose : Script that contains Gentoo Specific nginx Functions

function find_nginx {

  # Find current nginx directory
  # This will be pulled in from distro id
  # will also check folders by directory for safe measure
  # this function adds no functionallity

  # if it does not find the default directories of distro
  # This function will search /var /etc /usr /opt for apache
  #_HTTPDW=$( which httpd)
  #_APACHEW=$( which apache2)
  #_NGINXW=$( which nginx )

  #echo "inside find apache"
  # Uncommonet to see ID echo $_ID


  ####################################################### Start Gentoo Check

  if [ "$_ID" == 5 ];   # Start Main IF
  	then
      ####
      if [ -d "/etc/nginx" ]
        then
          echo "[OKAY]:Found Gentoo's nginx Directory Found at /etc/nginx"
        else
          echo " [ERROR]:Default Directories Not Found"
      fi

      ####
      if  [ -f "/etc/nginx/nginx.conf" ]
        then
          echo "[OKAY]:Found /etc/nginx/nginx.conf"
        else
          echo "[ERROR]:Default Gentoo nginx Configuration /etc/nginx/nginx.conf NOT FOUND"
      fi
      ####

      ####
      if [ -d "/etc/nginx" ]
        then
          echo "Found /etc/nginx "
        else
          echo "Default Directory of /etc/nginx NOT FOUND"
      fi
      ####


  fi   # End main IF

  ####################################################### End Gento Check
}
