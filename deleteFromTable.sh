#!/bin/bash
############### entering our database which contains our table
cd $DataUse
echo "~~~~~~~~~~~~~~~~~~~~~~$tableName~~~~~~~~~~~~~~~~~~"
cat $tableName
echo "enter the Id of the record you want to delete :("
read id

###### making sure that the id is only integr value ###########################
	while ! [[ $id =~ ^[0-9]*$ ]] || [[ $id =~ ['!@#$%^&*():_+'] ]] || [[ $id == "" ]] 
	do
	echo  "Invalid value for the id! enter your value again"
	read id
	done 


###################### checking if the input id  is in our table#################
if [ `awk '(NR>2)' $tableName  | awk -F : ' {print $1}'| grep $id ` ]
then
echo "Are you sure you want to delete record $id!!!!"
select val in "Yes" "No" "Exit"
do 
    case $val in 
    "Yes")
    clear

################## deleting the row if the input id #####################
    `sed -i '/^'$id'/ d' $tableName`;
    echo "record was deleted successfully";
    echo "Do you want to see the last version of $tableName Table??";
        select response in "Yes" "Back To Previous Menu"
        do  
            case $response in
                "Yes")
                    clear;
                    echo "$tableName updated version will appear for 5 seconds "
                    echo "~~~~~~~~~~~~~~~~~~~~~~$tableName~~~~~~~~~~~~~~~~~~"
                    cat $tableName;
                    sleep 5;
                    clear;
                    cd ..;
                    source UseTableSelect.sh;
                    ;;
                "Back To Previous Menu")
                clear;
                cd ..;
                source UseTableSelect.sh
                ;;
                *) 
                echo "please enter a valid input";;
            esac
        done
    ;;
    "No")
    clear;
    echo "Do you want to enter another ID or Go back to last menu?"
        select answer in "Enter_Another_ID" "Go_Back_To_Last_Menu"
        do
            case $answer in 
            "Enter_Another_ID")
                clear;
                cd ..;
                source deleteFromTable.sh;
            ;;
            "Go_Back_To_Last_Menu")
            clear;
            cd ..;
            source UseTableSelect.sh;
            ;;
            *) 
            echo "please enter a valid input";;
            esac
        done
    ;;
    "Exit")
    clear;
    cd ..
     echo "GoodBye :)" ; break 100
    ;;
     *) 
    echo "please enter a valid input";;
    esac
done

else
###################### if the input id is not in our table############################  
    echo "No record with ID : $id"
    echo "Do you want to enter another ID ,Go back to last menu or Exit?"
    select responsee in "Yes" "Go_Back" "Exit"
    do
        case $responsee in 
        "Yes")
            cd ..;
            clear;
            source deleteFromTable.sh
            ;;
        "Go_Back")
            clear;
            cd ..;
            source UseTableSelect.sh
            ;;
        "Exit")
            clear;
            cd ..
            echo "GoodBye :)" ; break 100
            ;;
        *) 
            echo "please enter a valid input";;
        esac
    done
fi