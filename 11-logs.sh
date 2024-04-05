#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date  +%F-%H-%M-%)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script strarted executing at $TIMESTAMP" >> $LOGFILE

if [ $ID -ne 0 ]
then
 echo "please run as root user"
  exit 1 # you can give other than 0
 else
  echo "u are root user"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}


yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"