#!/bin/bash
cd $DataUse
#################### Null Insert Validation as it can accepts empty string#################
if [[ $datatype == *"int"* ]]
then
	while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] 
	do
	echo  "Invalid input! enter your value again"
	read val
	done 

fi
if [[ $datatype == *"string"* ]]
then
	while ! [[ $val =~ ^[a-zA-Z]*$ ]] 
	do
		echo  "Invalid input! enter your value again"
		read val
	done 
					
fi