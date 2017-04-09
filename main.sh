#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/15/2016
# Purpose : Main script for various system administration scripts.
# This script is intended to perform various admin tasks that are focused to save time.
# Script needs super user access. NO EXCEPTIONS.

# Include Source Files

source ./include/src/general_functions.sh
source ./include/src/main_functions.sh
source ./include/etc/color_codes.sh

#Set Colors
backgroundFG

echo "
    ______________   __  _____
    | ___ \  _  \ \ / / |  ___|
    | |_/ / | | |\ V /  | |__ ___ _ __  _ __ ___  ___ ___  ___
    |  __/| | | |/   \  |  __/ __| '_ \| '__/ _ \/ __/ __|/ _ \|
    | |   | |/ // /^\ \ | |__\__ \ |_) | | |  __/\__ \__ \ (_) |
    \_|   |___/ \/   \/ \____/___/ .__/|_|  \___||___/___/\___/
                                 | |
                                 |_|

    Beta Version: 0.7
    Email: pena.m.luis@gmail.com
    For Latest Version Visit https://github.com/poszy/PDXEspresso

    PDXEspresso: A Collection of SysAdmin Scripts For Automation.
    Copyright (C) 2016-2017 Luis Miguel Pena @poszy

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

";

function main {

#Run start functions

check_root
create_dirs
check_distro

echo -e "\n"

INPUT=

until [ "$INPUT" = "0" ]; do

echo "What would you like to do?";

echo "1)  Searh Ports";
echo "2)  Create Backups"
echo "3)  User & Group Management";
echo "4)  Search For Config Files & Services";
echo "5)  Display CPU Info";
echo "6)  SSH Management";
echo "7)  Web Server Management";
echo "8)  IP Tables Management";
echo "9)  Package Management";
echo "10)  Install Third Party Software (Splunk,OSSEC)";
echo "11) Tail Auth Log";
echo "12) Clear All Debug Logs And Clear All Temp Files";
echo "13) Find/Stop Services ";
echo "14) Hash Entire System With Tripwire";

read INPUT

case $INPUT in

    1) scan_ports ; press_enter ;;
    2) init_backup; press_enter ;;
    3) init_userman ; press_enter ;;
    4) init_findfiles ; press_enter ;;
    5) find_cpui ; press_enter ;;
    6) init_sshd ; press_enter ;;
    7) init_webserver ; press_enter ;;
    8) init_tables ; press_enter ;;
    9) init_package ; press_enter ;;
    10) init_third ; press_enter ;;
    11) tail_auth ; press_enter ;;
    12) clear_dirs ; press_enter ;;
    13) stop_service ; press_enter ;;


    0) exit ;;
    *) echo "Enter a digit above and try not to break this program.";


      esac
done

} # end main


# Calling main function.
# This loops the program and allows a user to get .
# Out of a sub menu and back to the main program.
main
