#!/bin/bash
echo "enter the name of the table you want to create :)"
read tableCreate

############# Making our Table Global to All defaults ################ 


export $tableCreate

##################  Entering the selected Database before###########


cd $DataUse

##################### making sure that there is no table with the same name##################
if [ `find . -name $tableCreate `  ]
then 
    clear
    echo "table already exists "
    select rep in "Go back to Previous page" "Exit"
    do  
        case $rep in
        "Go back to Previous page")
        clear;
        cd .. ;
        source UseDataBaseSelect.sh
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
   
else 
############# there is no table with our name but checking that the name is in valid format ########################
    if [[ -z $tableCreate ]] || [ "${tableCreate//[!0-9]}" != "" ] || [[ $tableCreate =~ ['!@#$%^&*():_+'] ]] 
    then 
    clear ;
    echo "~~~~~~~~~~~~~~~~~~~ FileName is not a Valid Value ~~~~~~~~~~~~~~~~~~~~~~~~~~";
    cd ..;
    source CreateTable.sh
    else
    touch $tableCreate
    columns="ID:"
	datatype="int(Not_NULL):"
		echo "~~~~~~~~~Table (ID) is created automatically in the first field as (PK)~~~~~~~~~~"
        echo "~~~~~~~~~Table columns can't exceed 10 columns~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
########### starting from field number 2 as ID already taken Field Number 1#######################        
		FieldNumber=2
		function insert {
################## to get name of the field the user wants in the table ####################
			echo "Enter field number $FieldNumber:"
			read field


####################### Validating that the field is in string form only ######################################
            while [[ -z $field ]] || [[   "${field//[!0-9]}" != ""  ]] || [[ $field =~ ['!@#$%^&*():_+'] ]] 
            do
                echo "field name can't contain numbers,special Characters or empty &please enter a valid value"
                read field
            done
            export $field


############### to be sure there is no duplicated field name ################################
            if [ `echo $columns | grep $field` ]
            then 
                echo "field Named $field already exists";
                insert
            else


############## adding our field to the header row ##############################
			columns+="$field"

			echo "Choose the datatype:"
			select data in "Integer" "String"
			do
				case $data in
					"Integer" ) datatype+="int"; break;;
					"String" ) datatype+="string";   break;;
					* ) echo "Invalid choice";
				esac
			done
			echo "Choose it can be NULL or not:"
			select prop in "NULL" "Not_NULL"
			do
				case $prop in
					"NULL" ) datatype+="";  break;;
					"Not_NULL" ) datatype+=" (Not_NULL)";  break;;
					* ) echo "Invalid choice";
				esac
			done
################ we limited our table to only 10  fields ###############          
        if [  $FieldNumber -lt 10 ]
        then
################## asking the user if he want to enter another field or now (untill number of fields exceeds 10)###########
			echo "Insert another field?"
			select check in "Yes" "No"
			do
				case $check in
					"Yes" )
                    if [ $FieldNumber -lt 10 ]
                    then
###########  adding the seprators to our rows to make it clear to idetnify the fields###################
                    ((FieldNumber=FieldNumber+1)) ;
					columns+=":";datatype+=":"; 
######### calling the function again every time to ask the user and making sure every time of our format#########
					insert ; 
                    fi
					break ;;
					"No")
                     break ;;
					*) 
                    echo "Invalid choice";
				esac
			done
            fi
        fi
		}

		insert
######### to append our two rows in the table #####################
		echo $columns>>$tableCreate
		echo $datatype>>$tableCreate
	
    

	echo "table $tableCreate created successfully :)"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    cd ..
    source UseDataBaseSelect.sh
    fi
fi
