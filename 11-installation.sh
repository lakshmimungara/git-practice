#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

if [ $USERID -ne 0 ]
then    
    echo "Please run this script with root privileges"
    exit 1
fi 

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "Git is not installed. Installing it now..."
    dnf install git -y 
    if [ $? -ne 0 ]
    then
        echo "Git installation is not success.. check it once"
        exit 1
    else
        echo "Git is installed successfully"
    fi 
else
    echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed. please install it now"
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "MYSQL installation is failure. please check it"
        exit 1
    else 
        echo "MYSQL is already installed and it is success"
    fi 
else 
    echo "MYSQL is already installed"
fi
