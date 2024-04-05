#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$($NUM1+$NUM2)

echo "Total:: $SUM"
echo "How many args passed:: $#"  #it gives count of args passed 
echo "All args passed:: $@"       #it shows all args passed
echo "Script name:: $0"               #it shows script name