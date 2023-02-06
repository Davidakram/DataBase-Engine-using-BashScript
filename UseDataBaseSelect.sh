#!/bin/bash
cd $DataUse
 echo "~~~~~~~~~~~~~~~~~~~ $DataUse DataBase ~~~~~~~~~~~~~~~~~~~~~~~~~~"
 choices=("Show Tables" "Use Table" "Delete Table" "Create Table" "Back to Main_Menu" "Exit")
    select val in "${choices[@]}"
    do
        case $val in 
        "Show Tables")
        clear;
        ls;
        select re in "Back to Pervious Menu" "Exit"
        do 
            case $re in 
            "Back to Pervious Menu")
            clear;
            cd ..; 
            source UseDataBaseSelect.sh;
            ;;
           
            "Exit")
             cd .. ;
             echo "GoodBye :)" ; break 100
             ;;
             *) 
                echo "please enter a valid input";;
             esac
        done
        ;;
        "Use Table")
        clear;
        cd ..; 
        source UseTable.sh

        ;;
        
        "Delete Table")
        clear ;
        cd .. 
        source DeleteTable.sh
        ;;
        "Create Table")
        clear; 
        cd ..;
        source CreateTable.sh

        ;;
        "Back to Main_Menu")
        clear ;
        cd .. ;
        source MainmenuSelect.sh
        ;;

        "Exit")
         cd .. ;
        echo "GoodBye :)" ; break 20
        ;;
        *) 
        echo "please enter a valid input";;
        esac
    done