#!/bin/bash
echo -e  "\U0001f603 Starting to install the recommended utilities for ubuntu"
#sudo apt update && sudo apt upgrade
#echo "Ubuntu is up to date"
sudo apt-get install sysstat vnstat iotop iftop bwm-ng htop munin

echo -e  "\U0001F600"
# Add the new user account
# Arguments:
#   Account Username
#   Account Password
for i in $( cat /home/ubuntu/users.txt ); do
    sudo useradd --home /home/$i  $i
    echo "user $i added successfully!"
    sudo echo $i:$i"123" | sudo  chpasswd
    echo "Password for user $i changed successfully"
    sudo usermod -aG sudo $i
    sudo mkdir /home/$i
    sudo chown $i:$i /home/$i
    sudo su - $i -c "mkdir -p /home/$i/.ssh; cd /home/$i/.ssh; chmod 700 /home/$i/.ssh; echo "" | ssh-keygen -t rsa -N "$i" "
    sudo  mkdir  /home/$i/sample
    echo  -e "User $i \U0001F600 is ready to roll"
#To delete the user from the account
    #sudo deluser --remove-home $i
    #echo "user $i deleted successfully"
done
