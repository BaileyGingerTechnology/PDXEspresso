#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : Debian's APT Package Manager Functions.

function apt_all {

  echo "APT Will now update the entire DISTRO, EXCLUDING DISTRO HOPPING"
  apt-get update && apt-get upgrade

}

function apt_install {

  echo "Type in Package you would like to install"
  _APTIN=
  read _APTIN
  apt-get install "$_APTIN"
}

function apt_remove {

  echo "APT will now remove package and configuration files"
  _APTOUT=
  read _APTOUT
  apt-get purge "$_APTOUT"

}

function apt_sync {
  echo  "APT will now resync repos"
  apt-get update
}

function apt_local {

  echo "Type in local path to .deb archive"
  _APTPATH=
  read _APTPATH

  dpkg -i "$_APTPATH"

}

function apt_rmlocal {

  echo "Type DPKG Package Name to uninstall"
  _APTRMPATH=
  read _APTRMPATH

  dpkg -r "$_APTRMPATH"

}

function apt_devel {

  echo " APT will install Development Build tools required by programs like OSSEC"
  apt-get install build-essential

}

function apt_hop {
  echo "Now Attempting to Distro Hop"
  apt-get dist-upgrade
}

function apt_searchinstalled {

  echo "APT will now Search for installed packages"
  dpkg -l

  echo "Would you like to filter this list with an argument ? y/n ?"

  declare -l _DPKGGREP=
  read _DPKGGREP

  if ["$_DPKGGREP" = y];
    then
      echo "What Package Would you like to Filter?"

      _DPKG2
      read _DPKG2
      dpkg --get-selections |grep "$_DPKG2"
  else
    echo " DONE!!"

  fi

}
