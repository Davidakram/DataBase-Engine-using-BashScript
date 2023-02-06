cd $DataUse

##################### updating The data after getting the record and the id ############
########## to replace the data we loop on the file and then enter the record with the id given
####### then we change field number data with the new value
y=`awk -F: -v OFS=: '{if ( $1 == '$id' ) $'$x' = "'$val'"; print $0 }' $tableName`
#### writing our updated record in the table 
echo "$y" > $tableName
echo "$tableName was updated:)"
 select reply in "Update Another Field" "Back To previous menu" "Exit"
do   
     case $reply in
        "Update Another Field")
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
            cd ..;
            echo "GoodBye :)" ; break 100
            ;;
        *) 
            echo "please enter a valid input";;
    esac
done