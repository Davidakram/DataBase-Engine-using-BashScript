#!/bin/bash
echo "Enter the Name of the DataBase you want to use :)"
read DataUse
export $DataUse 
# to be used in createTable 
if [ ` find  -name "$DataUse" ` ] 

then
    clear 
   
    source UseDataBaseSelect.sh
else 
clear;
echo "~~~~~~~~~~~~~~No DataBase Named $DataUse was found~~~~~~~~~~~~~~~ "
select choice in  "Back to Main Menu" "Exit"
    do
    case $choice in 
    "Back to Main Menu")
    clear;
    source MainmenuSelect.sh
    ;;
    "Exit")
    echo "GoodBye :)" ; break 100
    ;;
    *) 
    echo "please enter a valid input";;
    esac
    done
fi