#!/bin/bash
# For emoji use this link --> https://unicode.org/emoji/charts/full-emoji-list.html#1f600
# for reference https://github.com/jasonheecs/ubuntu-server-setup/blob/master/setupLibrary.sh
echo -e  "\U0001f603 Starting to install the recommended utilities for ubuntu"

#sudo apt update && sudo apt upgrade
#echo "Ubuntu is up to date"

# echo -e  "\U0001F600"
# Add the new user account
# Arguments:
#   Account Username
#   Account Password
for i in $( cat /home/ubuntu/users.txt ); do
    sudo adduser --home /home/$i  $i
    echo "user $i added successfully!"
    sudo echo $i:$i"123" | sudo  chpasswd
    echo "Password for user $i changed successfully"
    sudo usermod -aG sudo $i
    sudo mkdir /home/$i
    sudo chown $i:$i /home/$i
    echo  -e "User $i \U0001F600 is ready to roll"
done
