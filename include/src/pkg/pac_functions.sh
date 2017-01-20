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

function pac_splunk {

	echo "Installing Splunk"
  curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/splunk.tar.gz /opt/splunk.tar.gz
  tar -xvf /opt/splunk.tar.gz

  cd /opt/splunk && makepkg -si
  echo "Done Compiling Splunk ...  "
  echo -e "\n"

  echo "Now Installing the Splunk Forwarder"
  curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/splunkforwarder.tar.gz /opt/splunkforwarder.tar.gz
  tar -xvf /opt/splunkforwarder.tar.gz

  cd /opt/splunkforwarder && makepkg -si
  echo "Done Compiling Splunk Forwarder"
  echo -e "\n"

  echo "Now Configuring Splunk"

  echo "Adding Splunk User"
  #Add splunk user
  useradd splunk
  echo "Done!..."
  echo -e "\n"

  echo "Chaning Ownership of splunk directory"
  #Change ownership of splunk directory
  chown -R splunk:splunk $SPLUNK_HOME
  echo "Done!..."
  echo -e "\n"

  #Change user to splunk
  echo "Changing to Splunk User and Accepting Licence"

  su splunk
  /opt/splunk/bin start --accept-license
  /opt/splunk/bin enable boot-start -user splunk

  echo "Done!..."
  echo -e "\n"


}

function splunk_run {
  su splunk
  cd /opt/splunk/bin start

}

function pac_nagios {

  echo "Installing Nagios"
}

function pac_tripwire {

  echo "Installing tripwire"
}
