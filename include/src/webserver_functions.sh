#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/04/2017
# Purpose : Script that contains web server functions.


function find_apache {

  # Find current Apache directory
  # This will be pulled in from distro
  # will also check folders by directory for safe measure
  # this function adds no functionallity

  # if it does not find the default directories of distro
  # This function will search /var /etc /usr /opt for apache
  _HTTPDW=$( which httpd)
  _APACHEW=$( which apache2)
  _NGINXW=$( which nginx )
  _EME=$( which  )
  _ID=

  if [ ! -z "$_HTTPDW" ];
  	then
  		echo " Found Apaceh webserver at"
  fi
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
