#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : Gentoo's Emerge Package Manager Functions.




function eme_main { 


	echo "inside Gentoo's Script"
}

function eme_all { 

emerge -uDN --with-bdeps=y @world                                                                                        

}


function eme_install { 

	echo "Enter Package name that you wish to install"
	_EMEINSTALL=
	read _EMEINSTALL

	echo "Now Installing ..."
	emerge --ask "$_EMEINSTALL"


}

function eme_remove {

	echo "Enter Package name that you wish to Remove"
	_EMEREMOVE=
	read _EMEREMOVE

	echo "Now removing"
	emerge --unmerge "$_EMEREMOVE"
}


function eme_sync {
	echo "Syncing mirrors with latest updates..."
	emerge --sync 

}


function eme_splunk { 

	echo "Installing Splunk"
	
}