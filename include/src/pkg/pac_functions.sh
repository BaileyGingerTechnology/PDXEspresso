#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : Arch's Pacman Package Manager Functions.

function pac_all {
  echo "Running -SYU can break system, becareful, arch likes to break"
  pacman -Syu

}


function pac_install {

	echo "Enter Package name that you wish to install"
	_PACINSTALL=
	read _PACINSTALL

	echo "Now Installing ..."
	pacman -S "$_PACINSTALL"


}

function pac_remove {

	echo "Enter Package name that you wish to Remove"
	_PACREMOVE=
	read _PACREMOVE

	echo "Now removing"
	pacman -R "$_PACREMOVE"
}


function pac_sync {
	echo "Syncing mirrors with latest updates..."
	pacman -Sy

}

function pac_local {

  echo "Now Attemption to Install local TARBALL"

}

function pac_rmlocal {

  echo "Removing local software built with a TARBALL"
}

function pac_devel {

  echo "Installing Pacman Buildtools, including AUR dependencies"
   pacman -S --needed base-devel

}

function pac_searchinstalled {
  echo "Searching for Pacakge"

}


function pac_user { 

 useradd splunk

}

function pac_splunk {
  
  # Temp User needed to compile AUR Packages
  echo "Type In Temp user on system to compile Splunk From AUR"
  echo "USER SPLUNK SHOULD ALREADY EXIST"

  _TEMPU=
  read _TEMPU
 
  su - "$_TEMPU" -c " curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/splunk.tar.gz; 
  pwd; tar -xvf splunk.tar.gz; 
  pwd; cd ./splunk; 
  pwd; 
  makepkg -si; 
  pwd;"
  pwd
  echo "this"
  cd /home/"$_TEMPU"/
  pwd
  pacman -U /home/"$_TEMPU"/splunk/splunk-6.5.1_f74036626f0c-1-x86_64.pkg.tar
  
  su - root -c "chown -R splunk:splunk /opt/splunk"

  su - splunk -c "/opt/splunk/bin/./splunk start --accept-license"
  su - splunk -c "/opt/splunk/bin/./splunk enable boot-start -user splunk"
	
}

function pac_run {
  
  su - splunk -c  " /opt/splunk/bin/splunk start"

}

function pac_forwarder { 

  echo "Now Configuring Splunk"
  
 
  echo "Now Installing the splunk forwarder to /opt/splunkforwarder"

  su - "$_TEMPU" -c " curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/splunkforwarder.tar.gz;
  tar -xvf ./splunkforwarder.tar.gz; 
  cd splunkforwarder;
  makepkg -si; "
  pacman -U /home/"$_TEMPU"/splunkforwarder/splunkforwarder-6.5.1_f74036626f0c-1-x86_64.pkg.tar


}




function pac_nagios {

  echo "Installing Nagios"
}

function pac_tripwire {

  echo "Installing tripwire"
}
