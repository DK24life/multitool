#!/bin/bash

echo "------------------------------"
echo "Multitool version 2"
echo "Please, select a function:"
echo "[1] Create user"
echo "[2] Delete user"
echo "[3] Download a file with wget"
echo "[4] Output all processes on host"
echo "------------------------------"
echo "[0] Exit"

while [ 1 ]
do

echo -n "->"
read choice
case $choice in
1)
echo "------------------------------"

while [[ -z "$newusername" ]]; do
read -p "Enter a username for new user: " newusername
done
read -s -p "Enter a password for new user: " password
useradd -m $newusername
echo "$newusername:$password" | chpasswd
newusername=""
echo
echo "------------------------------"
;;
2)
echo "------------------------------"
while [[ -z "$delusername" ]]; do
read -p "Enter username (del): " delusername
done
userdel -r $delusername
delusername=""
echo "------------------------------"
;;
3)
echo "------------------------------"
read -p "Enter a URL for downloading file: " file_url
if [[ -z "$file_url" ]]; then
	echo "URL is empty! Please input number 3 and try again!"
else
wget $file_url
file_url=""
echo "------------------------------"
fi
;;
4)
echo "------------------------------"
ps axu
echo "------------------------------"
;;
0)
echo "Good bye!"
break
;;
*)
echo "Invalid option!"
;;
esac
done
