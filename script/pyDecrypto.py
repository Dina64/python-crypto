#!/usr/bin/env python3

import os
import shutil

from Crypto.PublicKey import RSA

#creation d´un couple de clés
key = RSA.generate(1024)

#dechiffrage
public_key = key.publickey()
enc_data = public_key.encrypt(b"""Decryptage""",32)

x = key.decrypt(enc_data)
x = x.decode('utf-8')

#afficher ses clés:
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

source = "clePriv.pem"
source1 = "clePub.pem"

target = "../src/decrypted/clePriv.pem"
target1 = "../src/decrypted/clePub.pem"

shutil.copy(source, target)
shutil.copy(source1, target1)
os.remove(source)
os.remove(source1) 
