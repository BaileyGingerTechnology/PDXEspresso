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

# January 3nd 2016
______________   __  _____                                   
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

You Are Currently using Bash GNU bash, version 4.3.48(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


Testing on a Gentoo host. 
By Default gentoo does not support iptables because of some kernel modules not being loaded. 

Error 1: " iptables v1.4.21: can't initialize iptables table `nat': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded." 

Fix 1: Posted by acmondor https://forums.gentoo.org/viewtopic-t-1009770-start-0.html . Need to enable NAT

Symbol: IP_NF_NAT [=y] 
  │ Type  : tristate 
  │ Prompt: iptables NAT support 
  │   Location: 
  │     -> Networking support (NET [=y]) 
  │       -> Networking options            
  │         -> Network packet filtering framework (Netfilter) (NETFILTER [=y]) 
  │           -> IP: Netfilter Configuration                                                            
  │ (2)         -> IP tables support (required for filtering/masq/NAT) (IP_NF_IPTABLES [=y]) 
  │   Defined at net/ipv4/netfilter/Kconfig:219                                                                      
  │   Depends on: NET [=y] && INET [=y] && NETFILTER [=y] && IP_NF_IPTABLES [=y] && NF_CONNTRACK_IPV4 [=y] 
  │   Selects: NF_NAT [=y] && NF_NAT_IPV4 [=y] && NETFILTER_XT_NAT [=y]
  enabling CONFIG_IP_NF_NAT solved everything 

  Functions that work on Gentoo

[X]  Scan Ports
[X]  User & Group Management
3)  Search For config Files
[X]  Display CPU Info
5)  SSH Management
6)  Apache Management
7)  IP Tables Management
8)  Find Package Information
9)  Find Distro Information
[X] Tail Auth log
[X] clear all debug logs and clear all temp files
[X] Find/Stop Services 
