#!/bin/bash

LOGS_FOLDER="/var/log/shell"
SCRIPT_NAME=$(echo $0)
TIMESTAMP=$(date)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log
mkdir -p $LOGS_FOLDER

R= "e/[31m"
G= "e/[32m"
N= "e/[0m"

CHECK_ROOT() {
    if [$(id -u) -ne 0]
        then
        ech0 -e" $R you dont have root previlages to run this script $N"
        exit 1
    fi
}

VALIDATE() {
    if [$1 -ne 0]
    then 
    echo -e" $2 is $R FAILED $N" | tee -a $LOG_FILE
    else
    echo -e"$2 is $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE() {
    echo -e "$R USAGE: package name mention maado bolimagane $N " &>>$LOG_FILE
    exit1 
}

echo " script started at : $(date)"
CHECK_ROOT

if [ $# -eq 0] 
then 
    USAGE
fi

for PACKAGE in $@
do
dnf installed list $PACKAGE
    if [$? -ne 0]
        then
    echo " $package is not installed yet . going to install " | tee -a &>> $LOG_FILE
    VALIDATE $? " installing $PACKAGE " 
    else
    echo -e "$G $PACKAGE IS ALREADY INSTALLED . NOTHING TO DO $N " | tee -a &>> $LOG_FILE
fi
done
