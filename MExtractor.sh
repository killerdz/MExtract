#!/bin/bash
#this script coded by kira-dz
#metasploit .apk payload scan + info extract v0.1
#my first code :)
#writed + tested on termux
#Enjoy
#banner
python banner.py
#if you have new idea to devlope
#MY FB : https://www.facebook.com/khalid.dz.589
y='\033[1;33m'
if [ -e "$HOME/.UNZIP" ]
then
rm -rf "$HOME/.UNZIP"
fi
printf "\033[1;31mEnter Payload path : "
read path
if [ "$path" == "" ] || [ ! -d $path ]
then
printf "\033[1;32mFolder Not found...Try Again\n"
sleep 3
bash MExtractor.sh
fi
cd $path
printf "\033[1;31mEnter Payload Name + .apk : "
read pname
if [ "$pname" == "" ] || [ ! -f $pname ]
then
printf "\033[1;32mapk Not Found...Try AGAIN"
sleep 2
exit 0 
elif [ $pname != "" ] 
then
printf "\033[1;32m[#]>>>>>> Start Compressing..."
printf "\n"
sleep 4
fi
cd $HOME
mkdir .UNZIP
sleep 2
cp $path/$pname $HOME/.UNZIP
cd $HOME/.UNZIP
mv $pname D.zip
sleep 2
unzip D.zip
mv classes.dex class.txt
printf "\033[1;31mDo want to scan if it payload or not ? [Y/N] : "
read c
printf "\033[1;32m[#]>>>>>> Start Scanning..."
printf "\n"
sleep 4
if [ "$c" = "N" ] || [ "$c" = "NO" ] || [ "$c" = "n" ] || [ "$c" = "no" ]
then
sleep 3
printf "\033[0;35mOK BEY\n"
exit
elif [ "$c" = "Y" ] || [ "$c" = "YES" ] || [ "$c" = "y" ] || [ "$c" = "yes" ]
then
try=$(grep "tcp://" class.txt)
fi 
if [ "$try" == "" ]
then
printf "\033[1;33mI Think Its Not a Metasploit Payload , Try Manual Scan...\n"
printf "\033[0;31mMy work is Done BEY :)"
exit 0
elif [ "$try" != "" ]
then
printf "\033[1;31mit's a MetaSploit Payload\n"
fi
printf "\033[1;31m you wana get inf ? [N/Y] : "
read inf
if [ "$inf" = "N" ] || [ "$inf" = "NO" ] || [ "$inf" == "n" ] || [ "$inf" = "no" ]
then
printf "\033[0;31mOK BEY\n"
printf "\n" 
exit 
elif [ "$inf" = "Y" ] || [ "$inf" = "YES" ] || [ "$inf" = "y" ] || [ "$inf" = "yes" ]
then
meta=$(grep -a "tcp://" class.txt | cut -d ':' -f2- | tr -d '\0')
V=$(echo $meta | tr -d "//,)" | tr ":" "\n")
for hp in $V
do
echo -e "${y}Payload informations are :[>>>$hp<<<]\n"
done
sleep 3
cd $HOME
rm -rf .UNZIP
fi
exit 0
