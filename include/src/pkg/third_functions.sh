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

function splunk_run { 

	su splunk
	/opt/splunk/bin start
}


function splunk_echo { 

	echo "testing..."
}
