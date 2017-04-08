#!/bin/bash
# Author  : Luis M Pena
# Date    : 4/08/2017
# Purpose : Script that contains color variables for debug messages.

### Colors
#_BLACK     0,0,0 # 0
#_RED       1,0,0 # 1
#_GREEN     0,1,0 # 2
#_ORANGE    1,1,0 # 3
#_BLUE      0,0,1 # 4
#_MAGENTA   1,0,1 # 5
#_CYAN      0,1,1 # 6
#_GRAY     1,1,1 # 7
#_WHITE    #9
## End

#Forground Colors
export _BLACK=$(tput setaf 0)
export _RED=$(tput setaf 1)
export _GREEN=$(tput setaf 2)
export _ORANGE=$(tput setaf 3)
export _BLUE=$(tput setaf 4)
export _MAGENTA=$(tput setaf 5)
export _CYAN=$(tput setaf 6)
export _GRAY=$(tput setaf 7)
export _WHITE=$(tput setaf 9)

# Background Colors
export _BLACKBG=$(tput setab 0)
export _REDBG=
export _GREENBG=$(tput setb 2)
export _ORANGEBG=$(tput setab 3)
export _BLUEBG=$(tput setab 4)
export _MAGENTABG=$(tput setab 5)
export _CYANBG=$(tput setab 6)
export _GRAYBG=$(tput setab 7)
export _WHITEBG=$(tput sgr 1)
export _BGCL=$(tput sgr 0)

# Notification Codes With White Backgrounds
_MSGOKAY=$(echo -e $_BLACK $_GRAYBG"[OKAY]:"$_WHITE $_GREENBG)
_MSGSUCCESS=$(echo -e $_BLUE $_GRAYBG"[SUCCESS]:"$_WHITE $_GREENBG)
_MSGWARNING=$(echo -e $_ORANGE $_GRAYBG"[WARNING]:"$_WHITE $_GREENBG)
_MSGERROR=$(echo -e $_RED $_GRAYBG"[ERROR]:"$_WHITE $_GREENBG)
_MSGLOADING=$(echo -e $_CYAN $_GRAYBG"[LOADING]:"$_WHITE $_GREENBG)
_MSGDONE=$(echo -e $_BLACK $_GRAYBG"[DONE]:"$_WHITE $_GREENBG)
_MSGFOUND=$(echo -e $_MAGENTA $_GRAYBG"[FOUND]:"$_WHITE $_GREENBG)

#_MSGSUCCESS=$(echo -e "$(tput setaf 4) $(tput setab 7)"[SUCCESS:]" $(tput setaf 9)$(tput setab 2)")


function backgroundFG(){

# Setting PDXEspresso Forground and Background Colors
# Exit colors via escape character
# Colors reflect U of O
echo -e "setaf 9\nsetab 2" | tput -S

}
