#!/bin/bash

USERID=$(id -u)
R="\e[35m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")
mkdir -p $LOGS_FOLDER
echo "script started executing at :$(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo -e "$R You are running with root access $N" | tee -a $LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$R Installing $2 is ... SUCCESS $N" | tee -a $LOG_FILE
    else
        echo "Installing $2 is ... FAILURE" | tee -a $LOG_FILE
        exit 1
    fi
}

for packages in ${PACKAGES[@]}
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
then
    echo "$package is not installed... going to install it"| tee -a $LOG_FILE
    dnf install  $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
else
    echo "$package is already installed...Nothing to do" | tee -a $LOG_FILE
fi
done
  