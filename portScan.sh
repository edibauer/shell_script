#!/bin/bash

function ctrl_c() {
    echo -e "\n [!] Saliendo..."
    exit 1

}

# ctrl-c
trap ctrl_c INT

# for syntax
for port in $(seq 1 30); do
    (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] El puerto está abierto" || echo "[+] El puerto esta cerrado"
done


