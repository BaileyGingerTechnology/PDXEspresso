#!/bin/bash
# Author  : Luis M Pena
# Date    : 4/08/2017
# Purpose : Script that contains general web server functions.
source ./include/src/general_functions.sh
source ./include/src/websrv/arch/httpd_functions.sh
source ./include/src/websrv/arch/nginx_functions.sh


echo "[OKAY]: SUCCESS!"
echo "What would you Like to do?"


function main {

    _CHOICE=
    echo "Arch Webserver Interface";

    echo "1) Apache Management";
    echo "2) Nginx Management";


    read _CHOICE

case $_CHOICE in

    1) find_apache; press_enter ;;
    2) find_nginx; press_enter ;;


    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";

      esac


}

main
