#!/bin/bash
cd $DataUse

echo "~~~~~~~~~~~~~~~~~~~~~~$tableName~~~~~~~~~~~~~~~~~~"
################# printing the first field of the last record  of the table ##################
num=`awk -F : 'END{print $1}' $tableName`
########### knowing if there is ids in the table or the table was just created
		if [[ $num == *'Not_NULL'* ]]
		then
			id=1
			
		else
################## making the id identity 
			((id = $num + 1 )) 
		fi
########### adding the id to the row ################
		row="$id:"
################# getting the number of the fields of the table in order to loop on them ##################
		field=`awk -F : END'{print NF}' $tableName`
		for (( i = 2; i <= $field ; i++ )) 
		do
################ getting the field name and the data type to make sure that the data inserted is valid############
			fieldName=$(awk -F : ' BEGIN {field = '$i'}{if(NR==1){print $field;}}' $tableName)
			datatype=$(awk -F : ' BEGIN {field = '$i'}{if(NR==2){print $field;}}' $tableName)
			echo "Enter Column$i: ($fieldName):"
			read val
################ checking the datatypes #######################
			if [[ $datatype == *"Not_NULL"* ]]
			then
				while [  -z $val  ]
				do 
					echo  "This value cannot be empty!"
					read val
				done
				cd ..
				source ValidtingInsert.sh
			else 
			cd ..
				source NullInsert.sh

	        fi 			
			
#################### if we inserted data in the last field it is inserted without (:)###########################
			if [[ i -eq $field ]]
			then
				row+="$val"
			else
################### but if the field isnt the last one , data is inserted appended with (:)#########################
			    row+="$val:"
		    fi
		done
################## appending our row in the table############################################
		echo $row>>$tableName
		clear
		echo "The record is inserted to $tableName successfully :)"
		echo "Insert another record?"
		select check in "Yes" "No"
		do
			case $check in
				"Yes" ) 
					clear ; 
					cd ..;
					source InsertIntoTable.sh; 
					clear ;
			    break;;
				"No" ) 
					clear ;
					cd ..;
					source UseTableSelect.sh;
					clear;
					break;;
				* ) 
				echo "Invalid choice";
				;;
			esac
		done