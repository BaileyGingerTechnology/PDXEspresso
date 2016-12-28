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
