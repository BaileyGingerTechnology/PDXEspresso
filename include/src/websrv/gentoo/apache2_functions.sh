#!/bin/bash
# Author  : Luis M Pena
# Date    : 3/28/2017
# Purpose : Script that contains Gentoo Specific Apache2 Functions
function find_apache {

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
      if [ -d "/etc/apache2" ]
        then
          echo "[OKAY]:Found Gentoo's Apache2 Directory Found at /etc/apache2"
        else
          echo " [ERROR]:Default Directories Not Found"
      fi

      ####
      if  [ -f "/etc/apache2/httpd.conf" ] && [ -f "/etc/conf.d/apache2" ]
        then
          echo "[OKAY]:Found /etc/apache2/httpd.conf & /etc/conf.d/apache2"
        else
          echo "[ERROR]:Default Gentoo apache2 Configuration /etc/apache2/httpd.conf OR /etc/conf.d/apache2 NOT FOUND"
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

  ####################################################### End Gento Check
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
