#!/bin/bash
cd $DataUse

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
########## in the last file we got the field and here we get the id of the record ############### 
echo "enter the id of the record which you want to update "
read id
######### making sure that the id is only integr
    while ! [[ $id =~ ^[0-9]*$ ]] || [[ $id =~ ['!@#$%^&*():_+'] ]] || [[ $id == "" ]] 
	do
	    echo  "Invalid input! id must be a number "
        
	    read id
	done 
  ######## checking the id is in our table #####################
    if [ `awk '(NR>2)' $tableName  | awk -F : ' {print $1}'| grep $id ` ]
    then
### here we get the first line of the table then replacing every : with spaces  and looping them using awk to 
##make it in lines and then grepping the field in those lines to get the number of the field and store it in (x) 
        x=`sed -n 1p $tableName | awk '{gsub(":"," ");print}' |awk 'BEGIN{RS=FS}/'$field'/{print NR}' ` 
        echo "enter the new value of $field in row with id:$id"
        read val 
###### getting the data type of given field from the second row ########################
        datatype=` awk -F : 'NR==2 {print $'$x'}' $tableName `
####### and then checking the data type #####################################
        if [[ $datatype == *"Not_NULL"* ]]
        then
            while [  -z $val  ]
			do 
				echo  "This value cannot be empty!"
				read val
			done
            if [[ $datatype == *"int"* ]]
            then
                while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] || [[ $val == "" ]] 
                do
                echo  "Invalid input! enter your value again"
                read val
                done 
                cd .. ;
                source updatingDataofTable.sh
            fi
            if [[ $datatype == *"string"* ]]
            then
                while ! [[ $val =~ ^[a-zA-Z]*$ ]] || [[ $val == "" ]] 
                do
                    echo  "Invalid input! enter your value again"
                    read val
                done 
                cd .. 
                source updatingDataofTable.sh
                    
            fi
            
        else 
        if [[ $datatype == *"int"* ]]
        then
            while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] 
            do
            echo  "Invalid input! enter your value again"
            read val
            done 
            cd .. 
            source updatingDataofTable.sh
        fi
        if [[ $datatype == *"string"* ]]
        then
            while ! [[ $val =~ ^[a-zA-Z]*$ ]] 
            do
                echo  "Invalid input! enter your value again"
                read val
            done 
            cd .. 
            source updatingDataofTable.sh                
        fi  
        fi
############ if the input id wasnt in our table ##############3
    else
        echo "no id $id was found in this table"
        cd .. ;
        source ValidatingIDinUpdate.sh;
    fi