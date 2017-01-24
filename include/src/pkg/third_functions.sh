#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : Functions That Install Third Party Software.


function splunk_install {


if [ -d /opt/splunk];
	then
		echo "Splunk Already exist! Just run it with option #2"

	else


    #Add splunk user
    useradd splunk

    #install splunk as root
    # Find Splunk located in ./include/raw/splunk.tgz
    tar xvzf  ./include/raw/splunk.tgz -C /opt

    #Change ownership of splunk directory
    chown -R splunk:splunk $SPLUNK_HOME

    #Change user to splunk
    su splunk
    /opt/splunk/bin start --accept-license
    /opt/splunk/bin enable boot-start -user splunk

fi

}

function  splunk_forwarder {

	echo "Installing forwarder"
  echo "USER SPLUNK SHOULD ALREADY EXIST"

	# Testing on Redhat 7

	# I have to extract and then copy the folder because some distros do not have the -C commmand
  tar -xzvf ./include/raw/release/splunkforwarder5_64.tgz
  cp -Rp ./splunkforwarder /opt/splunkforwarder

  chown -R splunk:splunk /opt/splunkforwarder
  chmod -R 755 /opt/splunkforwarder

  /opt/splunkforwarder/bin/./splunk start --accept-license
  /opt/splunkforwarder/bin/./splunk enable boot-start -user splunk


}

function splunk_run {

	su - splunk -c "/opt/splunk/bin start"
}

function splunk_run2 {

	echo "First Type in full Host name of Splunk central server (example 192.168.0.1 OR domain.site2.whatever) "
	_SHOST=
	read _SHOST
	echo "Now Type in Port Number of Splunk cetnral server"
	_SPORT=
	read _SPORT




	su - splunk -c " whoami; 
	cd /opt/splunkforwarder/bin; 
	./splunk add forward-server $_SHOST:$_SPORT;

	./splunk add monitor /var/log;
	./splunk restart;
	whoami "

}


function ossec_install {

	echo "Installing ossec"

}

function snort_install {

	echo "Installing SNORT"

}

function tripwire_install {

	echo "Installing tripwire"

}


function nagios_install {

	echo "This Will install nagios"
 xsaxsa

}
