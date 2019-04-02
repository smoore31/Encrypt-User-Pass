#!/bin/bash
#This script will ask for username and password to encrypt with the same salt and passphrase

function GenerateEncryptedString() {
    local STRING="${1}"
	SALT=$(openssl rand -hex 8)
	K=$(openssl rand -hex 12)
	ENCRYPTEDUSER=$(echo "${STRING}" | openssl enc -aes256 -a -A -S "${SALT}" -k "${K}")
}

read -p "Enter Your Username: "  username

GenerateEncryptedString "$username"



function GenerateEncryptedString() {
    local STRING="${1}"
	ENCRYPTEDPASS=$(echo "${STRING}" | openssl enc -aes256 -a -A -S "${SALT}" -k "${K}")
}


read -s -p "Enter Password: " pswd


GenerateEncryptedString "$pswd"

echo
echo "===== Username and Password Encryptyed for $username ====="
    echo "Encrypted Username String: ${ENCRYPTEDUSER}"
    echo "Encrypted Password: ${ENCRYPTEDPASS}"
    echo "Salt: ${SALT} | Passphrase: ${K}" 