#this script coded by kira-dz
#metasploit .apk payload scan + info extract v0.1
#my first code :)
# writed + tested on termux
#Enjoy
#banner
python banner.py
#if you have new idea to devlope
#MY FB : https://www.facebook.com/khalid.dz.589
sleep 2
mkdir .UNZIP
echo "Enter payload path : "
read path
cd $path
echo "Enter payload name + .apk : "
read pname
cp $pname $HOME/.UNZIP
sleep 2
cd $HOME/.UNZIP
mv $pname D.zip
sleep 2
unzip D.zip
sleep 3
mv classes.dex class.txt
echo "Do want to scan if it payload or not ? [Y/N] "
read c
if [ "$c" == "N" ]
then
echo "OK BEY"
exit
elif [ "$c" == "Y" ]
then
try=$(grep "tcp://" class.txt)
fi 
if [ "$try" == "" ]
then
echo "i think its not a meta payload , try Manual Scan"
elif [ "$try" != "" ]
then
echo "its a meta payload"
fi
echo "you wana get inf ? [N/Y]"
read inf
if [ "$inf" == "N" ]
then
echo "ok You can go"
exit 
elif [ "$inf" == "Y" ]
then
meta=$(grep -a 'tcp://' class.txt)
echo "Payload inf is :" "$meta"
cd $HOME
rm -rf .UNZIP
fi
exit

