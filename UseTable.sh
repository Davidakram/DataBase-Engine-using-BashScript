#!/bin/bash
echo "Enter the Name of the table you to want use :"
read tableName
export $tableName
cd $DataUse
if [ ` find . -name $tableName ` ]
then 
    cd .. 
    clear; 
    source UseTableSelect.sh
else 
    clear;
    echo " No table Named  $tableName  is found"
    select ans in "Enter the table name again" "Back to Previous Menu" "Exit"
    do  
        case $ans in 
        "Enter the table name again")
        clear;
        cd ..;
        source UseTable.sh;
        ;;
        "Back to Previous Menu")
        clear;
        cd ..;
        source UseDataBaseSelect.sh;
        ;;
        "Exit")
        clear ;
        cd ..;
        echo "GoodBye :)" ; break 100
        ;;
        *) 
        echo "please enter a valid input";;
        esac 
    done

fi
