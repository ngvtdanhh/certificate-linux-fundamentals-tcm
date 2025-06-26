#!/bin/bash

FILE="demo-file.txt"
echo "[+] Creating file '$FILE'..."
touch "$FILE"
echo "Confidential Data" > "$FILE"

echo "[+] Setting permissions to 764 (rwxrw-r--)..."
chmod 764 "$FILE"
ls -l "$FILE"

echo "[+] Adding SUID bit..."
chmod u+s "$FILE"
ls -l "$FILE"

echo "[+] Adding SGID bit..."
chmod g+s "$FILE"
ls -l "$FILE"

echo "[+] Adding sticky bit..."
chmod +t "$FILE"
ls -l "$FILE"

echo "[*] Final permissions:"
stat "$FILE"
