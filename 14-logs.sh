   #!/bin/bash

USERID=$(id -u)
R="\e[35m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "script started executing at :$(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access" &>>$LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo -e "$R You are running with root access $N" &>>$LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$R Installing $2 is ... SUCCESS $N" &>>$LOG_FILE
    else
        echo "Installing $2 is ... FAILURE" &>>$LOG_FILE
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed...Nothing to do" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$R python3 is not installed... going to install it" &>>$LOG_FILE
    dnf install python3 -y $N &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo "python3 is already installed...Nothing to do" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...Nothing to do" &>>$LOG_FILE
fi