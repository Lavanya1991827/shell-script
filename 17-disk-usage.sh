#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')

DISK_THRESHOLD=1  # it will be changed actuvally we will give 7 to 80 percentage but we dont have that much data for testing .so just giving 1 value.
message=""


while IFS= read line
do 
  usage=$(echo $line | awk '{print -$6F}' | cut -d % -f1)  #here $line =]df -hT | grep -vE 'tmp|File' . 6F ->means 6th position it will dispaly
  partition=$(echo $line | awk '{print $1F}')            #it shows partition name like /dev/xvdf . . 1F ->means 1st position it will dispaly
  
   usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
  
  if [ $usage -ge $DISK_THRESHOLD ]
  then
     message+="High Disk Usage on $partition: $usage <br>"
  fi   
done <<< $DISK_USAGE

echo -e "Message: $message"

echo -e "Message: $message"

#WAY-1
#echo "$message" | mail -s "High Disk Usage" info@joindevops.com
echo "$message" | mail -s "High Disk Usage" lavanyact002@gmail.com

#WAY-2
#sh mail.sh "DevOps Team" "High Disk Usage" "$message" "info@joindevops.com" "ALERT High Disk Usage"


#disk usage filter command
#df -hT | grep -vE 'tmp|File' | awk '{print $6F}' | cut -d % -f1

