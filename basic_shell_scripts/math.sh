#!/bin/bash 


# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com



echo enter the value of a 
read a
echo enter the value of b
read b 

add=`expr $a + $b`
sub=`expr $b - $a`
mul=`expr $a \* $b`
div=`expr $a / $b`
echo Addtion of $a and $b is $add
echo Subtraction of $a from $b is $sub
echo Multiplication of $b and $a is $mul
echo division of $a and $b is $div 
