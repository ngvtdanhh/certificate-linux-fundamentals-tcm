#!/bin/bash

USER_TO_ADD="demo_user"

if id "$USER_TO_ADD" &>/dev/null; then
    echo "[!] User '$USER_TO_ADD' already exists. Deleting first..."
    sudo deluser --remove-home "$USER_TO_ADD"
    echo "[+] User deleted."
fi

echo "[+] Creating user '$USER_TO_ADD'..."
sudo adduser --gecos "" "$USER_TO_ADD" --disabled-password
echo "[+] Setting password to 'P@ssw0rd'"
echo "$USER_TO_ADD:P@ssw0rd" | sudo chpasswd
sudo usermod -aG sudo "$USER_TO_ADD"
echo "[+] User '$USER_TO_ADD' created and added to sudo group."

echo "[*] User info:"
id "$USER_TO_ADD"
