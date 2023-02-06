#!/bin/bash
cd $DataUse

echo $tableName
cat $tableName 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "do you want to update a field in a record or update column name??"
select replay in "Field data" "Column Name" "Back to previous menu"
do  
    case $replay in 
        "Field data")
        cd ..;
        clear;
        source UpdateField.sh;
        ;;
        "Column Name")
        cd ..;
        clear;
        source ColumnNameUpdate.sh
        ;;
        "Back to previous menu")
        cd ..;
        clear;
        source UseTableSelect.sh
        ;;
        *) 
        echo "please enter a valid input";;
    esac 
done