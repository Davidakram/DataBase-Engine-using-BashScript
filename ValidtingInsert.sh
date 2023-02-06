#!/bin/bash
cd $DataUse
if [[ $datatype == *"int"* ]]
then
	while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] || [[ $val == "" ]] 
	do
	echo  "Invalid input! enter your value again"
	read val
	done 

fi
if [[ $datatype == *"string"* ]]
then
	while ! [[ $val =~ ^[a-zA-Z]*$ ]] || [[ $val == "" ]] 
	do
		echo  "Invalid input! enter your value again"
		read val
	done 
		
fi