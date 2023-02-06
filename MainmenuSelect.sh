#!/bin/bash
echo "~~~ MENU ~~~"

select choice in "Create Data Base" "Use Data Base" "Show Data Bases" "Delete Data base" "Exit" 
do 
case $choice in
    "Create Data Base")
      clear;
      source CreateDataBase.sh 
    ;;
    "Use Data Base")
    clear;
    source ConnectingDataBases.sh
    ;;
    "Show Data Bases")
    clear;
     source listDataBases.sh
    ;;
    "Delete Data base")
    clear;
     source DeleteDataBase.sh
    ;;
    "Exit")
    echo "GoodBye :)" ; break 100
    ;;
    *) echo "please enter a valid input" ; 
    ;;
    esac

done

