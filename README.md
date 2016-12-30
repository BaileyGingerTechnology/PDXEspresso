# PDXEspresso
Administrastion scripts for a Linux based host.

# Sciript Tree
manage.sh
  
include
    |
    |---> iptables.sh (Loops back to manage.sh)
    |---> scan.sh
    |---> raw
           -> 

iptables
    |
    |---> debug.log
    |---> iptables.txt
log
    |
    |---> debug.log
    |---> results.txt
    |---> users.txt
   
sshd
    |
    |---> sshd.log
    |---> sshd.txt

# December 26th 2016
As of today I decided to manage my changes through github. 
The script is changing fast everyday and im starting to lose track to why im making these changes.
Most changes are code refactoring and code layout. Shell scripts are messy and im organizing the code as I move forward. 
As today this script has been tested with CentOS 7 . 

# December 27th 2016
Changed manage.sh to main.sh
changed the file strucutre of the way the debug logs get stored. also refacored a lot of code and renamed files to have bettter organization. 

# December 30 2016
 _________________________
| ___ \  _  \ \ / / |  ___|                                  
| |_/ / | | |\ V /  | |__ ___ _ __  _ __ ___  ___ ___  ___   
|  __/| | | |/   \  |  __/ __| '_ \| '__/ _ \/ __/ __|/ _ \  
| |   | |/ // /^\ \ | |__\__ \ |_) | | |  __/\__ \__ \ (_) | 
\_|   |___/ \/   \/ \____/___/ .__/|_|  \___||___/___/\___/  
                             | |                             
                             |_|                          
Author: Luis Miguel Pena @poszy
Beta Version: 0.2
Email: pena.m.luis@gmail.com
For Latest Version Visit https://github.com/poszy/PDXEspresso

You Are Currently using Bash GNU bash, version 4.2.46(1)-release (x86_64-redhat-linux-gnu)
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

