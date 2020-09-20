#!/bin/bash

if [[ -d "export PATH=$PATH:~/Documents/Projet_git/python-crypto/bin" ]]; then
	echo "ce PATH existe deja"
else
	mkdir ~/Documents/Crypt_tools/tocrypt
	mkdir ~/Documents/Crypt_tools/crypted
	mkdir ~/Documents/Cryp_tools/todecrypt
	mkdir ~/Documents/Crypt_tools/decrypted
	echo "export PATH=$PATH:~/Documents/Projet_git/python-crypto/bin">>~/.bashrc
	cp -r ~/Documents/Projet_git/python-crypto/bin  ~
	echo "export PATH=$PATH:~/bin">>~/.bashrc
	if [[ -e ~/src ]]; then
		cp -r ~/Documents/Projet_git/python-crypto/install/install.sh ~/src
		echo "export PATH=$PATH:~/src">>~/.bashrc
	else
		mkdir ~/src
		cp -r ~/Documents/Projet_git/python-crypto/install/install.sh ~/src
		echo "export PATH=$PATH:~/src">>~/.bashrc
	fi
	cp -r ~/Documents/Projet_git/python-crypto/bin/updatePythonCrypto ~/bin
	cp -r ~/Documents/Projet_git/python-crypto/service/cryptService.sh /etc/cryptService.sh
	chmod +x /etc/cryptService.sh
	cp ~/Documents/Projet_git/python-crypto/cryptService.service /etc/systemd/system/cryptService.service
	systemctl enable cryptService.service
	systemctl start cryptService.service
fi
