#!/bin/sh

# Present At 
# Switch to
# Create folder
# Open file
# Weather report
# Upload to Server
# SSH Connection
# oPEN GOOGLE
# SEARCH IN WIKIPEDIA
# Show work list
# Manual
# SMS Sending
# PLOT
espeak -p 20 -v en+f5 "Hello Sir "
figlet -c Welcome Aditya
./system.sh
while IFS= read -r line; do
	notify-send --icon computer "TODAY'S WORK SIR " "\n\n$line\n"
done <todo.txt
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
while true
do
echo "${RED}------------------------------------------------------${NC}"
echo "${BLUE}Show Manual Details (15) ${NC}"
read -p "Enter the Choice .. :" FRUIT

case "$FRUIT" in
   "1") ls
	a=$(pwd) 
	notify-send $a
   ;;
   "2") read -p "Switch to Where (/Deskop/Folder) :" path
	cd /home/adada/$path
	notify-send "Switched to /home/adada/$path"
   ;;
   "3") read -p "Index Name :" path1
	mkdir $path1
	b=$(pwd)
	notify-send "Folder Created at $b"
   ;;
   "4") read -p "Which File :" file1
	gedit $file1
   ;;
   "5") read -p "Location : " loc
	espeak -p 22 -v en+f5 "Monitoring Sir  " 
	curl wttr.in/$loc
   ;;
   "6") cd /home/adada/Desktop
	sh gitscript.sh
   ;;
   "7") espeak -p 22 -v en+f5 "Byee Sir Have a good day  " 
	break
   ;;
   "8") ip=$(hostname -I)
	echo $ip
	sudo systemctl start ssh
	sudo systemctl status ssh
	notify-send "adada@$ip:22"
	echo "${RED} SSH START adada@$ip:22 ${NC}"
   ;;
   "9") sudo systemctl stop ssh
	sudo systemctl status ssh
   ;;
   "10") w3m https://www.google.com
   ;;
   "11") read -p "What Sir ... :" search
	 espeak -p 22 -v en+f5 "Searching Sir   " 
	 w3m https://www.wikipedia.org/wiki/$search
	 
   ;;
   "12") while IFS= read -r line; do
		notify-send --icon tablet "TODAY'S WORK SIR " "\n$line"
	done <todo.txt	
   ;;
   "13") echo "${RED}Enter manually (TO,FROM,SUBJECT,Message and ctrl+d${NC}" 
	ssmtp www.justsyittome@gmail.com
	notify-send "Email Sent !"
	break
   ;;
   "14") read -p "Url sir ..." url
	 read -p "pdf name .. " pdf
	 wkhtmltopdf $url $pdf
	 notify-send "Pdf Created"
   ;;
   "15") gnome-terminal -e 'sh -c " bash manual.sh;sleep 10 "'
   ;;
   "16") echo "Okay Sir "
	 gnome-terminal -e 'sh -c " bash graph_help.sh;sleep 10 "'
	 gnuplot
   ;;
   "17") read -p "Mobile Number :" no
	 read -p "Message : " mssg
	 
	 curl -X POST https://api.twilio.com/2010-04-01/Accounts/AC93b2d4f9d54b4bbdf0e182fecaa7df8f/Messages.json \
--data-urlencode "From=+14809234858" \
--data-urlencode "Body=$mssg #(Send From Mr. Aditya's Private Server !! )" \
--data-urlencode "To=+91$no" \
-u AC93b2d4f9d54b4bbdf0e182fecaa7df8f:be28bc82f488f2352360da115504f089
   ;;
   "18") pwd
	 read -p "/home/adada/ (/Desktop/File name )" filename
	 cd /home/adada/Dropbox-Uploader
         ./dropbox_uploader.sh upload /home/adada/$filename /dropbox/OwnScript/
	 notify-send "Uploaded Successfully"
	 ./dropbox_uploader.sh list
   ;;

   	
esac
done
