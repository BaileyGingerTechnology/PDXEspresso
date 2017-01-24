#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : RHEL YUM Package Manager Functions.

function yum_all {

  echo "YUM Will now update everything"
  yum update -y
}

function yum_install {

  echo "Type in Package you would like to install"
  _YUMIN=
  read _YUMIN
  yum install "$_YUMIN" -y
}

function yum_remove {

  echo "YUM will now remove package and configuration files"
  _YUMOUT=
  read _YUMOUT
  yum remove "$_YUMOUT"

}

function yum_sync {
  echo  "YUM will now resync repos"
  yum check-update
}

function yum_local {

  echo "Type in local path to RPM"
  _RPMPATH=
  read _RPMPATH

  rpm -ivh "$_RPMPATH"
 #-i to install , v to print verbose (-V to verify) and h to print the has.
}

function yum_rmlocal {

  echo "Type RPM install name"
  _RPMRMPATH=
  read _RPMRMPATH

  rpm -e "$_RPMRMPATH"

}

function yum_devel {

  echo "YUM will install Development Build tools required by programs like OSSEC"
  yum groupinstall "Development Tools"  --setopt=group_package_types=mandatory,default,optional
}

function yum_sec {

  echo "YUM will now install only security updates"
  yum update --security || yum update-minimal --security



}

function yum_ossec {

  echo "What would you like to do?"
  echo "NOTE: Development Tools must be installed"

  echo " 1) Install OSSEC Server"
  echo " 2) Install OSSEC Agent "

  _OCHOICE=
  read _OCHOICE

if ["$_OCHOICE" = 1]; 
  then
    echo "Installing OSSEC Server"
    wget -q -O – https://www.atomicorp.com/installers/atomic | sh
    yum install ossec-hids ossec-hids-server 

elif ["$_OCHOICE" =2 ]
  then
    echo "Installing OSSEC Agent"
    wget -q -O – https://www.atomicorp.com/installers/atomic | sh
    yum install ossec-hids ossec-hids-client 

else 
  echo "Nothing was selected.. Now exiting"
  exit 0;
fi

}