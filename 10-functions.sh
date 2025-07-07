 dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
else
    echo "python3 is already installed...Nothing to do"
fi