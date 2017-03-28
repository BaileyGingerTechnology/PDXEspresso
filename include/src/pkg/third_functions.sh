#!/bin/bash
# Author  : Luis M Pena
# Date    : 1/18/2017
# Purpose : Functions That Install Third Party Software.


function splunk_install {


echo "Installing forwarder"
echo "USER SPLUNK SHOULD ALREADY EXIST"

# Testing on Redhat 7
# I have to extract and then copy the folder because some distros do not have the -C commmand

tar -xzvf ./include/raw/release/splunk6_64.tgz
cp -Rp ./splunk /opt/splunk

chown -R splunk:splunk /opt/splunk
chmod -R 755 /opt/splunk

/opt/splunk/bin/./splunk start --accept-license
/opt/splunk/bin/./splunk enable boot-start -user splunk



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

	su - splunk -c "/opt/splunk/bin/./splunk start"
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

	echo " ERROR!  Libpcap library version >= 1.0.0 not found.
    Get it from http://www.tcpdump.org
    Gentoo:emerge --ask net-analyzer/tcpdump dev-libs/libdnet
    "



	wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz 
	tar -xzvf daq-2.0.6.tar.gz 
	cd ./daq-2.0.6
	
	./configure 
	make
	make install


	wget https://www.snort.org/downloads/snort/snort-2.9.9.0.tar.gz
	tar xvfz snort-2.9.9.0.tar.gz
                    
	cd snort-2.9.9.0
	./configure --enable-sourcefire 
	 make
	 make install


	#In order for normal users to run tcpdump the program should be built with the suid flag enabled and the user(s) should be added to the tcpdump group.

	#root #USE="suid" emerge -a --changed-use tcpdump
	#Do this by using the usermod command where <username> is user's username:

	#root #usermod -a -G tcpdump <username>

}

function tripwire_install {

	echo "Installing tripwire"

}


function nagios_install {

	echo "This Will install nagios"
 xsaxsa

}
