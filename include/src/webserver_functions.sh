#!/bin/bash
# Author  : Luis M Pena
# Date    : 3/28/2017
# Purpose : Script that contains general web server functions.

#########################################################
## Initilize Distro Dependent Web Server Functions
#########################################################
function get_id {

  #echo "inside find apache"
  # Uncommonet to see ID echo $_ID

  export _ID=$(sed -n '1p' < ./debug/distro/distroid.cfg)

  #echo "Getting Distro ID";
  #echo "$_ID";

  if [ "$_ID" == 1 ]; then
    echo "[OKAY]: Debian Detected (Distro ID: 1)"
  fi


  if [ "$_ID" == 2 ]; then
    echo "[OKAY]: Ubuntu Detected (Distro ID: 2)"
  fi

  if [ "$_ID" == 3 ]; then
    echo "[OKAY]: RedHat Detected (Distro ID: 3)"
  fi


  if [ "$_ID" == 4 ]; then
    echo "[OKAY]: CentOS Detected (Distro ID: 4)"
  fi


  if [ "$_ID" == 5 ]; then
    echo "[OKAY]: Gentoo Detected (Distro ID: 5)"
    echo "[OKAY]: Starting Gentoo Web Server Interface"
    ./include/src/websrv/gentoo/start.sh
  fi

  if [ "$_ID" == 6 ]; then
    echo "[OKAY]: Arch Detected (Distro ID: 6)"
  fi

}
