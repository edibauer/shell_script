#!/bin/bash

# CTRL + C
#
function ctrl_c() {
    echo -e "\n\n [!] Saliendo...\n"
    exit 1 # Código de estado
}


trap ctrl_c INT
# sleep 9 # Delay

first_filename="data.gz"
# echo "[+] El archivo vale $first_filename"

decompressed_filename="$(7z l data.gz | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
# echo "[+] El siguiente archivo vale $decompressed_filename"

# Decompressing file
7z x $first_filename &>/dev/null

while [ $decompressed_filename ]; do
    echo -e "\n[+] Nuevo archivo descomprimido: $decompressed_filename"
    7z x $decompressed_filename &>/dev/null
    decompressed_filename="$(7z l $decompressed_filename 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
done

