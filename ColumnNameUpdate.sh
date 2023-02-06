#!/bin/bash
cd $DataUse
cat $tableName 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo enter the column name you want to change
read column
################3 checking if the column name is empty or ID as the Primary key cant be changed################
while [[ $column == "ID"  ]] || [ -z $column ]
do 
    echo "!!!!!!!Column name can't be empty or ID!!!!!!!"
    echo "enter another column name"
    read column
done
######################## then making sure that this column is in this table##############
if [  `sed -n 1p $tableName | grep $column`  ]
then

    echo are you sure you want to change $column value

    select ans in "Yes" "No" 
    do  
        case $ans in 
        "Yes")
            echo  enter the new name of the the column
            read new
############ validating the new value entered by the input and not a repeated field name ######################################
            while [[ -z $new ]] || [ "${new//[!0-9]}" != "" ] || [[ $new =~ ['!@#$%^&*():_+'] ]] || [[  `sed -n 1p $tableName | grep $new`   ]]
            do
                echo "invalid column  name !!!!" 
                echo "enter another  value cant contain numbers , special characters or spaces,or pre-exist value"
                read new
            done;
###################################### (S)ubstiting the old column with the new name  
            sed -i 's/'$column'/'$new'/' $tableName;
            clear; 
            cat $tableName;
            echo "Do you want to change another column name?"
            select  reply in "Yes" "No" "Exit"
            do 
                case $reply in 
                "Yes")
                    cd ..;
                    clear;
                    source ColumnNameUpdate.sh
                    ;;
                "No")
                    cd ..;
                    clear;
                    source UpdateIntoTable.sh
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
            ;;
        "No")
            clear; 
            cd ..;
             source UpdateIntoTable.sh
            
        ;;
        *)
            echo "invalid input"
        ;;
        esac 
    done
else 
############# if the user enterd a non-exist column name ###################
    echo no column named $column
    echo do you want to enter another value?
    select answeer in "Yes" "No"
    do 
        case $answeer in
        "Yes")
            clear;
            cd ..;
            source ColumnNameUpdate.sh
            ;;
        "No")  
            cd ..;
            clear;
            source UpdateIntoTable.sh
        ;;
        *)
            echo invalid input
        ;;
        esac
    done
fi




