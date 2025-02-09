#!/bin/bash

echo -n "Enter fist integer:"
read n1

echo -n "Enter second interger:"
read n2

sum=$(($n1+$n2))
product=$(($n1*$n2))

echo -n "the sum of $n1 and $n2 is: $sum"
echo  " \n"
echo -n "the product of $n1 and $n2 is: $product"

if [ $sum > $product ]
then
	echo -n "\nsum is greater than product of provided integers"

elif [ $sum < $product ]
then
	echo -n "\nsum is lesser than the product of provided interger"

elif [ $sum ==  $product ]
then
	echo -n "\nsum is equal to the product of the provided integers"
fi
