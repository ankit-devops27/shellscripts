#!/bin/bash

csv_file="./arrays_table.csv"

# parse table columns into 3 arrays
column_0=($(cut -d "," -f 1 $csv_file))
column_1=($(cut -d "," -f 2 $csv_file))
column_2=($(cut -d "," -f 3 $csv_file))

# print first array
echo "Displaying the first column:"
echo "${column_0[@]}"


## Create new array which is different of 2 other columns

#initialize arrary
column_3=("column_3")

#get the number of lines in array
nlines=$(cat $csv_file | wc -l)

echo "there ar total $nlines in the file"

#populate the other array

for ((i=1; i<$nlines; i++)); do
	column_3[$i]=$((column_2[$i] - column_1[$i]))
done

echo "${column_3[@]}"

## copy the new array to existing array

# first we will create a new file and save the header in it

echo "${column_3[0]}" > column_3.txt

## now copy the element in the file

for ((i=1; i<$nlines;i++)); do
	echo "${column_3[$i]}" >> column_3.txt
done

##merge the files

paste -d ","  $csv_file column_3.txt > report.txt


echo "New file output for the merged array :"
cat report.txt







