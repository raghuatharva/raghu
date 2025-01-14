userid=$(id -u)

if [ $userid -eq 0 ]; then
        echo " root access boy , let me check you ve got mysql installed or not "
        dnf list installed mysql-client
        else 
        echo " you dont have root access , BUGGER ;exiting ..."
        exit 1
fi ## else loops alli if condition barangilla .. if loop end aadmele barbodu ashte
    if [ $? -eq 0 ]; then
            echo " already installed "
            else
            echo " going to install mysql "
dnf install mysql -y
        if [ $? -eq 0 ]; then
            echo " mysql installed SUCCESSFULLY. WELCOME TO DATABASE WORLD"
            else
            echo " NOT INSTALLED PROPERLY .. CHECK "
            exit 1
        fi
    fi
