# PDXEspresso
Administrastion scripts for a Linux based host.

# Sciript Tree
manage.sh
  
include
    |
    |---> iptables.sh (Loops back to manage.sh)
    |---> scan.sh

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
