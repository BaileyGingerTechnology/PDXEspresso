#!/bin/bash
# Author  : Luis M Pena
# Date    : 12/27/2016
# Purpose : source file to include general functions. such as reset or main.
# That way I dont have to rewrite them.

function press_enter {

    echo ""
    echo -n "Press Enter To continue"
    read
    clear

}


function reset {
    main
    
} 
