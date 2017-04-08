#!/bin/bash
# Author  : Luis M Pena
# Date    : 4/08/2017
# Purpose : Script that contains Arch Specific httpd Functions
function find_httpd {

  # Find current Apache directory
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
      if [ -d "/etc/httpd" ]
        then
          echo "[OKAY]:Found Arch's httpd Directory Found at /etc/httpd"
        else
          echo " [ERROR]:Default Directories Not Found"
      fi

      ####
      if  [ -f "/etc/httpd/conf/" ] && [ -f "/etc/httpd/conf/httpd.conf" ]
        then
          echo "[OKAY]: Found /etc/httpd/conf & /etc/httpd/conf/httpd.conf"
        else
          echo "[ERROR]:Default Arch httpd Configuration /etc/httpd/conf OR /etc/httpd/conf/httpd.conf NOT FOUND"
      fi
      ####

      ####
      if [ -d "/etc/apache2" ]
        then
          echo "Found /etc/apache2 "
        else
          echo "Default Directory of /etc/apache2 NOT FOUND"
      fi
      ####


  fi   # End main IF

}


function remove_indexes {
  # will remove indexes

    echo "Removing Apache Indexes"

}

function add_htaccess {

  echo " Adding htc access file"
}

function add_modsec {

  echo "Downloading mod_security and adding owasp rules"
}

function add_proxy {

  echo "configuring mod_proxy"

}
