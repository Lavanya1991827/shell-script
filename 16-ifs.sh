#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ] # ! denotes opposite
then
    echo -e "$R Source directory: $file does not exists. $N"
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path # here ":" is seperator used
do
    echo "username: $username"
    echo "user ID: $user_id"
    echo "User Full name: $user_fullname"
done < $file    #giving file as input here