#!/bin/bash
echo  "Enter the name of Your Data Base" 
read databaseName



############ checking That the Name is in Valid Input ################################################################
if [[ -z $databaseName ]] || [ "${databaseName//[!0-9]}" != "" ] || [[ $databaseName =~ ['!@#$%^&*:/\\()_+'] ]]
then 
clear
 echo "~~~~~~~~~~~~~~~~~~~ DatabaseName is not a Valid Value ~~~~~~~~~~~~~~~~~~~~~~~~~~"
source CreateDataBase.sh
else
###########################checking if there is a pre-exist database with the same name#########################
  if [ -d $databaseName ] 
  then 
  clear
  echo "~~~~~~~~~~~~~~~~~~~ $databaseName Already Exists~~~~~~~~~~~~~~~~~~~~~~~~~~"
  select rep in "Go back to Main_Menu" "Create a New Data base"
  do 
    case $rep in
    "Go back to Main_Menu")
    clear;
    source MainmenuSelect.sh;
      
    ;;
    "Create a New Data base")
    clear;
    source CreateDataBase.sh 
    ;;
    *)
     echo "please enter a valid input" ; 
    ;;
    esac
   done
  ############# after making sure that there is no data base with the same name , Create Our data base#############
  else
    mkdir $databaseName
     echo "A new DataBase is created with name $databaseName :)"
     select reply in "Go back to Main_Menu" "Exit"
     do
        case $reply in 
        "Go back to Main_Menu") 
         clear;
         source MainmenuSelect.sh;
           
        ;;
        "Exit")
        echo "GoodBye :)" ; break 100
        ;;
        *) 
        echo "please enter a valid input";;
        esac
       done

  fi
fi

