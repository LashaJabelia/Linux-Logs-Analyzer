#!/bin/bash
echo " "
echo " "
echo "\__ BOOT LOGS __/"
echo " "
echo " "
for i in /var/log/boot.log /var/log/boot.log.1
do
        sudo cat $i | grep -e "---" | tail -n 20
done
echo " "
echo " "
echo "\__ SUDO COMMANDS USED __/"
echo " "
echo " "
sudo journalctl | grep -i sudo | grep "COMMAND" | tail -n 20
echo " "
echo " "
echo "\__ SUCCESSFULL LOGINS __/"
echo " "
echo " "
sudo last | tail -n 20
echo " "
echo " "
echo "\__ FAILED LOGINS __/"
echo " "
echo " "
sudo journalctl | grep -iE "failed password|authentication failure|invalid user" | tail -n 20
