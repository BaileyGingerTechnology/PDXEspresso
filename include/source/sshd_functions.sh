#!/bin/bash 
# Author  : Luis M Pena
# Date    : 1/04/2017
# Purpose : Script that contains sshd functions. 


source ./include/source/main_functions.sh

# Distro SSH Directories
# Debian

# Red Hat

# Arch 


# Gentoo
#/etc/conf.d/sshd
#/etc/init.d/sshd
#/etc/pam.d/sshd
#/usr/sbin/sshd

function manage_ssh { 
	
	echo $_DISTRO
	
	if [ $_DISTRO = gentoo ] ;
		then
			"SSHD Service Exist inside gentoo"
	fi
}


function lock_down { 


	# cp origional sshd file, rename it to bk. delete origional sshd file

	# replace by new one defined or in ./include/raw/sshd_config 
	echo "this"

}
