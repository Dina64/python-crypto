#!/usr/bin/env python3

import os
import shutil

from Crypto.PublicKey import RSA

#creation d´un couple de clés
key = RSA.generate(1024)

#chiffrage
public_key = key.publickey()
enc_data = public_key.encrypt(*.txt, 32)

k = key.exportKey('PEM')
p = key.publickey().exportKey('PEM')

#sauvegarder ses clés dans des fichiers:
with open('clePriv.pem','w') as kf:
	kf.write(k.decode())
	kf.close()

with open('clePub.pem','w') as pf:
	pf.write(p.decode())
	pf.close()

#importer des clés à partir d'un fichier
with open('clePriv.pem','r') as fk:
	priv = fk.read()
	fk.close()

with open('clePub.pem','r') as fp:
	pub = fp.read()
	fp.close()

privat = RSA.importKey(priv)
public = RSA.importKey(pub)

source1 = "clePriv.pem"
source2 = "clePub.pem"
target1 = "../src/crypted/clePriv.pem"
target2 = "../src/crypted/clePub.pem"

shutil.copy(source1, target1)
os.remove(source1)

shutil.copy(source2, target2)
os.remove(source2)
