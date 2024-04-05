#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ] 
then
    echo "please run as root user"
     exit 1 # you can give other than 0
else
   echo "u are root user"
fi


VALIDATE(){   #creating validate function

  if [ $1 -ne 0  ]
  then
   echo "ERROR $2..installation failed"
    exit 1
  else
   echo "$2 installation success."
   fi 

}

yum install mysql -y

VALIDATE $? "MYSQL"   #calling validate function

yum install git -y

VALIDATE $? "GIT"    #calling validate function