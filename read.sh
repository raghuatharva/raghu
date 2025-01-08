#!/bin/bash

# Hardcoded credentials
USERNAME="raghu"
PASSWORD="devops123"

# Ask for username
echo "Enter Username:"
read userinput

# Ask for password (hidden input)
echo "Enter Password:"
read -s passinput

# Validation
if [[ $userinput == $USERNAME && $passinput == $PASSWORD ]]; then
    echo "Welcome, DevOps Monster!"
else
    echo "Access Denied. Incorrect credentials."
fi
