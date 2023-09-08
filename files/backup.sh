#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : JsPhantom
# (C) Copyright 2023
# =========================================
# TEXT ON BOX COLOUR
box='\e[0m'
# LINE COLOUR
line='\e[0;32m'
# End
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
YB='\e[33;1m'
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")

itoken='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'

MYIP=$(curl -sS ipv4.icanhazip.com)
#NameUser=$(curl -sS https://raw.githubusercontent.com/msi8888/allow/main/accessmenu | grep $MYIP | awk '{print $2}')

clear
echo -e "\e[$line╔════════════════════════════════════════════╗${NC}"
echo -e "\e[$line║ \e[$box           • BACKUP PANEL MENU •          ${NC} \e[$line║$NC"
echo -e "\e[$line╚════════════════════════════════════════════╝${NC}"
echo -e "\e[$line╔════════════════════════════════════════════╗${NC}"
echo -e "\e[$line║${NC}  [INFO] Create password for database"
read -rp "   [INFO] Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "\e[$line║${NC}  [INFO] Processing... "
mkdir -p /root/backup
sleep 1

#cp /etc/passwd /root/backup/ &> /dev/null
cp -r /user /root/backup/user &> /dev/null
cp -r /usr/local/etc/xray /root/backup/xray &> /dev/null
cd /root
read -p "   Username : " username
NameUser=$username
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/Jesanne87/backup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser-$MYIP
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser-$MYIP/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser-$MYIP/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser-$MYIP/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser-$MYIP/
}

Save_And_Exit () {
    DATE=$(date +'%d %B %Y')
    cd /root/user-backup
    git config --global user.email "aramighty87@gmail.com" &> /dev/null
    git config --global user.name "Jesanne87" &> /dev/null
    #rm -rf .git &> /dev/null
    #git init &> /dev/null
    git add . &> /dev/null
    git commit -m backup &> /dev/null
    git branch -M main &> /dev/null
    #git remote add origin https://github.com/Jesanne87/backup
    git push -f https://$itoken@github.com/Jesanne87/backup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "\e[$line║${NC}  [INFO] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "\e[$line║${NC}  [INFO] Getting info server... "
Input_Data_Append
sleep 1
echo -e "\e[$line║${NC}  [INFO] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/Jesanne87/backup/main/$NameUser-$MYIP/$NameUser.zip"
sleep 1
echo -e "   [INFO] Backup done "
sleep 1
echo
sleep 1
echo -e "   [INFO] Generete Link Backup "
sleep 2
echo -e "   Your zip Backup file name = ${YB}$NameUser ${NC}"
echo -e "   Your zip password = ${YB}$InputPass ${NC}"
echo -e "   The following is a link to your vps data backup file.
   Your VPS IP $IP
   $link
   save the link pliss!"
echo -e "   If you want to restore data, please enter the link above."
echo -e "   Thank You For Using Our Services"
cd
rm -rf /root/backup &> /dev/null
rm -rf /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
echo -e "\e[$line╚════════════════════════════════════════════╝${NC}" 
echo -e "\e[$line╔════════════════════ BY ════════════════════╗${NC}"
echo -e "\e[$line║\e[$box            •   JsPhantom-VPN   •           \e[$line║${NC}"
echo -e "\e[$line╚════════════════════════════════════════════╝${NC}" 
echo -e ""
read -n 1 -s -r -p "      Press any key to back on menu"
menu

