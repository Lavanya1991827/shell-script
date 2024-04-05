#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
then
  echo "please try with root user"
  exit 1 # you can give other than 0
else
  echo "u are root user"
fi                       # fi means reverse of if, indicating condition end

yum install mysql -y

if[ $? -ne 0 ]
then
 echo "mysql installation failed"
 exit 1 
else
 echo "mysql installation success"
fi

yum install git -y

if[$? -ne 0]
then
 echo "git installation failed"
 exit 1 
else
 echo "git installed successfully"
fi

