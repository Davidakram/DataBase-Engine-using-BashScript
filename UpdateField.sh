#!/bin/bash
cd $DataUse

cat $tableName 
############ Here we make the user able to change the data he chooses by choosing the field name and the record where he wants to update####
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "enter the name of the field you want to update"
read field 
################# checking the field name is a valid format#############
while  [ "${field//[!0-9]}" != "" ] || [[ $field =~ ['!@#$%^&*():_+'] ]] 
do
    echo "invalid format input"
    echo "enter a string value for the column name"
    read field
done
###################### ID column  values cannt be changed as it is the Primary key################ 
while [[ $field == "ID" ]] || [[ -z $field ]]
do
    echo "you can't update the value of the primary key or the input empty"
    echo "enter another column name"
    read field
done
############## Making sure that the field is there in the table ############
if [[ ` sed -n 1p $tableName | grep -w $field ` ]]
then
    echo $field was found in table $tableName
    clear ;
    cat $tableName;
    cd ..
############ Redirecting the user to validate the update value
    source ValidatingIDinUpdate.sh

else
########## if there is no field with the input name  
        echo no field named $field
        select reply in "Enter Correct Field Name" "Back To previous menu" "Exit"
        do
         case $reply in 
         "Enter Correct Field Name")
         cd ..;
         clear;
         source UpdateField.sh;
         ;;
         "Back To previous menu" )
            cd ..;
            clear;
            source UpdateIntoTable.sh;
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




