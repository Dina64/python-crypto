#!/bin/bash 

#
# cryptService
#
/root/scripts/firewall.sh
Xvfb :2 -screen 0 800x600x24 &

for i in `ls ~/Documents/Crypt_tools | grep cryptService` ;
	if [ -e /tocrypt/*.txt ]
	then
    		./pyCrypto.py

	else if [ -e /to decrypt/*.txt ]
	then
   		 ./pyDecrypto.py 
	fi

exit 0
