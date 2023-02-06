#!/bin/bash
cd $DataUse

echo "Enter The Name of the Table you Want to delete "
read TableDelete
################################# finding our table ##############
if [ ` find . -name $TableDelete ` ]
then 
    echo "Are you Sure you want to delete "
    select answer in "Yes" "No" "Exit"
    do 
        case $answer in
        "Yes") 
        clear
############## removing our table####################
        rm  $TableDelete ;
        echo $TableDelete is removed successfully;
         select reply in "Go back to Previous" "Exit"
         do
             case $reply in 
             "Go back to Previous") 
             clear;
             cd ..
             source UseDataBaseSelect.sh;
             break   
             ;;
            "Exit")
            cd ..
            echo "GoodBye :)" ; break 100
            ;;
            *) 
            echo "please enter a valid input";;
            esac
        done
        ;;
        "No")
        cd ..
        clear;
        source UseDataBaseSelect.sh
        ;;
        "Exit")
        cd .. ;
        echo "GoodBye :)" ; break 100
        esac
    done
else 
######################## if the input tablename wasnt found #######################
    clear;
    echo "No table named $TableDelete"
    echo "Do you Want to go back or exit?"
    select repl in "Go Back" "Exit"
    do
        case $repl in 
        "Go Back")
        cd ..
        clear 
        source  UseDataBaseSelect.sh
        ;;
        "Exit")
        cd .. 
        echo "GoodBye :)" ; break 100 
        ;;
          *) 
        echo "please enter a valid input";;
        esac    
    done
fi
